package com.ryuland.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ryuland.dto.UserDTO;
import com.ryuland.entity.UserEntity;

@Component
public class UserConverter {
	@Autowired
	private ModelMapper modelMapper;
	
	public UserDTO toDto(UserEntity entity) {
		UserDTO dto = modelMapper.map(entity, UserDTO.class);
		return dto;
	}
	
	public UserEntity toEntity(UserDTO dto) {
		UserEntity entity = modelMapper.map(dto, UserEntity.class);
		return entity;
	}
	
	public UserEntity toEntity(UserEntity entity, UserDTO dto) {
		entity = modelMapper.map(dto, UserEntity.class);
		return entity;
	}
	
}
