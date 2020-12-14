package com.ryuland.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ryuland.converter.ProductConverter;
import com.ryuland.dto.ProductDTO;
import com.ryuland.entity.CategoryEntity;
import com.ryuland.entity.ProductEntity;
import com.ryuland.repository.ICategoryRepository;
import com.ryuland.repository.IProductRepository;
import com.ryuland.service.IProductService;
import com.ryuland.util.UploadFileUtils;

@Service
public class ProductService implements IProductService{
	
	@Autowired
	private IProductRepository productRepository;
	
	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired
	private ProductConverter productConverter;
	
	@Autowired
	private UploadFileUtils uploadFile;
	
	@Override
	public List<ProductDTO> findAll() {
		List<ProductEntity> entities = productRepository.findAll();
		List<ProductDTO> models = new ArrayList<ProductDTO>();
		for(ProductEntity i : entities) {
			ProductDTO dto = productConverter.toDTO(i);
			models.add(dto);
		}
		return models;
	}

	@Override
	public ProductDTO findById(Long id) {
		ProductEntity product = productRepository.findOne(id);
		return productConverter.toDTO(product);
	}


	@Override
	@Transactional
	public ProductDTO save(ProductDTO dto) {
		if(dto.getPathImage() != null) {	
			dto = uploadFile.writeOrUpdate(dto);
		}
		CategoryEntity category = categoryRepository.findOne(dto.getCategoryId());
		ProductEntity product = new ProductEntity();
		if(dto.getId() != null) {
			ProductEntity oldProduct = productRepository.findOne(dto.getId());
			product = productConverter.toEntity(oldProduct, dto);
		}else {
			product = productConverter.toEntity(dto);
		}
		product.setCategory(category);
		return productConverter.toDTO(productRepository.save(product));
	}

	@Override
	@Transactional
	public void delete(Long id) {
		productRepository.delete(id);
	}

}
