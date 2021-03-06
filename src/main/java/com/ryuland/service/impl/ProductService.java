package com.ryuland.service.impl;

import java.math.BigInteger;
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
import com.ryuland.repository.IOrderDetailRepository;
import com.ryuland.repository.IProductRepository;
import com.ryuland.service.IProductService;
import com.ryuland.util.StringUtils;
import com.ryuland.util.UploadFileUtils;

@Service
public class ProductService implements IProductService{
	
	@Autowired
	private IOrderDetailRepository orderDetailRepository;
	
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
			if(dto.getPathImage() != null) {
				uploadFile.deleteFile(oldProduct.getPathImage());
			}
			
			product = productConverter.toEntity(oldProduct, dto);
			product.setCreatedDate(oldProduct.getCreatedDate());
			product.setCreatedBy(oldProduct.getCreatedBy());
		}else {
			product = productConverter.toEntity(dto);
		}
		product.setCode(StringUtils.chuyenMa(dto.getName()));
		product.setCategory(category);
		return productConverter.toDTO(productRepository.save(product));
	}

	@Override
	@Transactional
	public void delete(Long id) {
		productRepository.delete(id);
	}

	@Override
	public List<ProductDTO> findListByTime() {
		List<ProductEntity> entities = productRepository.findListByTime();
		List<ProductDTO> models = new ArrayList<ProductDTO>();
		for(ProductEntity i : entities) {
			ProductDTO dto = productConverter.toDTO(i);
			models.add(dto);
		}
		return models;
	}

	@Override
	public List<ProductDTO> findListByBuy() {
		List<BigInteger> listId = orderDetailRepository.findProductIdByMostBuy();
		List<ProductDTO> models = new ArrayList<>();
		for(BigInteger i : listId) {
			ProductEntity entity = productRepository.findOne(Long.parseLong(i.toString()));
			ProductDTO dto = productConverter.toDTO(entity);
			models.add(dto);
		}
		return models;
	}

	@Override
	public List<ProductDTO> findListByDiscount() {
		List<ProductEntity> entities = productRepository.findListByDiscount();
		List<ProductDTO> models = new ArrayList<ProductDTO>();
		for(ProductEntity i : entities) {
			ProductDTO dto = productConverter.toDTO(i);
			models.add(dto);
		}
		return models;
	}

	@Override
	public List<ProductDTO> findAllByCategory(String nameCategory) {
		List<ProductEntity> entities;
		if(nameCategory.equalsIgnoreCase("tat-ca")) {
			entities = productRepository.findAll();
		}else {
			Long categoryId = -1L;
			List<CategoryEntity> categories = categoryRepository.findAll();
			for(CategoryEntity i : categories) {
				if(nameCategory.equalsIgnoreCase(i.getCode())) {
					categoryId = i.getId();
				}
			}
			if(categoryId >-1) entities = productRepository.findAllByCategory(categoryId);
			else entities = productRepository.findAll();
		}
		List<ProductDTO> models = new ArrayList<ProductDTO>();
		for(ProductEntity i : entities) {
			ProductDTO dto = productConverter.toDTO(i);
			models.add(dto);
		}
		return models;
	}

	@Override
	public List<ProductDTO> findAllByKey(String key) {
		key = StringUtils.chuyenMa(key);
		List<ProductEntity> entities1 = productRepository.findAllByKey();
		List<ProductEntity> entities2 = new ArrayList<>();
		for(ProductEntity j : entities1) {
			if(j.getCode().contains(key)) entities2.add(j);
		}
		
		List<ProductDTO> models = new ArrayList<ProductDTO>();
		for(ProductEntity i : entities2) {
			ProductDTO dto = productConverter.toDTO(i);
			models.add(dto);
		}
		return models;
	}

}
