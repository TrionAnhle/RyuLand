package com.ryuland.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ryuland.dto.ProductDTO;
import com.ryuland.entity.ProductEntity;

@Component
public class ProductConverter {
	@Autowired
	private ModelMapper modelMapper;
	
	public ProductDTO toDTO(ProductEntity entity) {
		ProductDTO dto = modelMapper.map(entity, ProductDTO.class);
		dto.setCategoryCode(entity.getCategory().getName());
		return dto;
	}
	
	public ProductEntity toEntity(ProductDTO dto) {
		ProductEntity entity = modelMapper.map(dto, ProductEntity.class);
		return entity;
	}
	
	public ProductEntity toEntity(ProductEntity entity, ProductDTO dto) {
		if(dto.getPathImage() == null) {
			dto.setPathImage(entity.getPathImage());
		}
		entity = modelMapper.map(dto, ProductEntity.class);
		return entity;
	}
}
