package com.ryuland.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryuland.converter.CategoryConverter;
import com.ryuland.dto.CategoryDTO;
import com.ryuland.entity.CategoryEntity;
import com.ryuland.repository.ICategoryRepository;
import com.ryuland.service.ICategoryService;

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
	
}
