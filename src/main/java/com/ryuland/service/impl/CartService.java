package com.ryuland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryuland.converter.ProductConverter;
import com.ryuland.dto.CartDTO;
import com.ryuland.dto.ProductDTO;
import com.ryuland.entity.ItemCart;
import com.ryuland.entity.ProductEntity;
import com.ryuland.entity.UserEntity;
import com.ryuland.entity.UserProductId;
import com.ryuland.repository.ICartRepository;
import com.ryuland.repository.IProductRepository;
import com.ryuland.repository.UserRepository;
import com.ryuland.service.ICartService;
import com.ryuland.util.SecurityUtils;

@Service
public class CartService implements ICartService{
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ProductConverter productConverter;
	
	@Autowired
	private IProductRepository productRepository;
	
	@Autowired
	private ICartRepository cartRepository;
	
	@Override
	public CartDTO findAllItemByUserId() {
		Long id = SecurityUtils.getPrincipal().getId();
		UserEntity entity = userRepository.findOne(id);
		CartDTO dto = new CartDTO();
		for(ItemCart i : entity.getItemCarts()) {
			ProductDTO productDto = productConverter.toDTO(i.getProduct());
			productDto.setQuantity(i.getQuantity());
			dto.getCarts().add(productDto);
		}
		return dto;
	}
	
	@Override
	public CartDTO saveItem(CartDTO dto) {		
		Long userId = SecurityUtils.getPrincipal().getId();
		Long productId = dto.getProductId();
		
		UserEntity user = userRepository.findOne(userId);
		ProductEntity product = productRepository.findOne(productId);
		if(dto.getQuantity() <= product.getQuantity()) {
			ItemCart itemCart = new ItemCart();
			itemCart.setId(new UserProductId(userId, productId));
			itemCart.setUser(user);
			itemCart.setProduct(product);
			itemCart.setQuantity(dto.getQuantity());
			cartRepository.save(itemCart);
			return findAllItemByUserId();
		}else{
			new Exception();
			return null;
		}
	}

	@Override
	public void delete(CartDTO dto) {
		Long userId = SecurityUtils.getPrincipal().getId();
		Long productId = dto.getProductId();
		cartRepository.delete(new UserProductId(userId,productId));
	}
}
