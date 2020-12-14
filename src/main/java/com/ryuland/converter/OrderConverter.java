package com.ryuland.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ryuland.dto.OrderDTO;
import com.ryuland.entity.TransactionEntity;
import com.ryuland.repository.UserRepository;

@Component
public class OrderConverter {
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private UserRepository userRepositoy;
	
	public OrderDTO toDto(TransactionEntity entity) {
		OrderDTO dto = modelMapper.map(entity, OrderDTO.class);
		dto.setFullname(userRepositoy.findOne(entity.getUser().getId()).getFullName());
		return dto;
	}
	
	public TransactionEntity toEntity(OrderDTO dto) {
		TransactionEntity entity = modelMapper.map(dto, TransactionEntity.class);
		return entity;
	}
	
	public TransactionEntity toEntity(TransactionEntity entity, OrderDTO dto) {
		entity = modelMapper.map(dto, TransactionEntity.class);
		return entity;
	}
	
}
