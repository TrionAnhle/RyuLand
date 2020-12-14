package com.ryuland.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ryuland.converter.CategoryConverter;
import com.ryuland.dto.CategoryDTO;
import com.ryuland.entity.CategoryEntity;
import com.ryuland.repository.ICategoryRepository;
import com.ryuland.service.ICategoryService;
import com.ryuland.util.StringUtils;

@Service
public class CategoryService implements ICategoryService{

	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	@Override
	public List<CategoryDTO> findAll() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for(CategoryEntity entity : entities) {
			CategoryDTO categoryDto = categoryConverter.toDto(entity);
			models.add(categoryDto);
		}
		return models;
	}

	@Override
	public CategoryDTO findById(Long id) {
		CategoryEntity category = categoryRepository.findOne(id);
		return categoryConverter.toDto(category);
	}



	@Override
	@Transactional
	public CategoryDTO save(CategoryDTO categoryDTO) {
		categoryDTO.setCode(StringUtils.chuyenMa(categoryDTO.getName()));
		CategoryEntity categoryEntity = new CategoryEntity();
		
		if(categoryDTO.getId() != null) {
			CategoryEntity oldCategory = categoryRepository.findOne(categoryDTO.getId());
			categoryEntity = categoryConverter.toEntity(oldCategory, categoryDTO);
		}else {
			categoryEntity = categoryConverter.toEntity(categoryDTO);
		}
		return categoryConverter.toDto(categoryRepository.save(categoryEntity));
	}

	@Override
	@Transactional
	public void delete(long id) {
		categoryRepository.delete(id);
	}
	
}
