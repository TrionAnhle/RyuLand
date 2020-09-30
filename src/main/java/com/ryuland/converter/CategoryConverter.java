package com.ryuland.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ryuland.dto.CategoryDTO;
import com.ryuland.entity.CategoryEntity;

@Component
public class CategoryConverter {
	@Autowired
	private ModelMapper modelMapper;
	
	public CategoryDTO toDto(CategoryEntity entity) {
		CategoryDTO dto = modelMapper.map(entity, CategoryDTO.class);
		return dto;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity entity = modelMapper.map(dto, CategoryEntity.class);
		return entity;
	}
	
}
