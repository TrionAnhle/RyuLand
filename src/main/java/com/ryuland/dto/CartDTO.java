package com.ryuland.dto;

import java.util.ArrayList;
import java.util.List;

public class CartDTO {
	
	private Long userId;
	private Long productId;
	private Long quantity;
	private List<ProductDTO> carts = new ArrayList<>();
	public Long getUserId() {
		return userId;
	}
	public Long getTotal() {
		Long tong = 0L;
		for(ProductDTO i : carts) {
			Long newPrice = i.getPrice() - (i.getPrice()*i.getDiscount())/100;
			tong+=(newPrice*i.getQuantity());
			tong+=(i.getQuantity()*10000);
		}
		return tong;
	}
	public Long getMoneyShip() {
		Long tong = 0L;
		for(ProductDTO i : carts) {
			tong+=(i.getQuantity()*10000);
		}
		return tong;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public List<ProductDTO> getCarts() {
		return carts;
	}
	public void setCarts(List<ProductDTO> carts) {
		this.carts = carts;
	}
	
	
	
}
