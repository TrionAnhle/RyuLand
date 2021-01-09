package com.ryuland.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ryuland.dto.CartDTO;
import com.ryuland.dto.ProductDTO;
import com.ryuland.entity.ItemCart;
import com.ryuland.entity.ProductEntity;
import com.ryuland.repository.IProductRepository;
import com.ryuland.repository.UserRepository;

public class CartConverter {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private IProductRepository productRepository;
	
	@Autowired
	private ProductConverter productConverter;
	
//	public CartDTO toDTO(Long id) {
//		CartDTO dto = new CartDTO();
//		List<ProductDTO> list = new ArrayList<>();	
//		
//		dto.setUserId(entity.getId().getUserId());
//		for(ItemCart i : entity.getUser().getItemCarts()) {
//			i.getProduct()
//		}
//		
//		return dto;
//	}
//	
//	public ItemCart toEntity(CartDTO dto) {
//		ProductEntity entity = modelMapper.map(dto, ProductEntity.class);
//		return entity;
//	}
//	
//	public ItemCart toEntity(ItemCart entity, CartDTO dto) {
//		if(dto.getPathImage() == null) {
//			dto.setPathImage(entity.getPathImage());
//		}
//		entity = modelMapper.map(dto, ProductEntity.class);
//		return entity;
//	}
}
