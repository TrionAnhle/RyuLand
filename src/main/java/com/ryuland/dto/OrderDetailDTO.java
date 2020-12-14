package com.ryuland.dto;

public class OrderDetailDTO {
	private Long quantity;
	private Long priceAtBuy;
	private ProductDTO product;
	public Long getPriceAtBuy() {
		return priceAtBuy;
	}
	public void setPriceAtBuy(Long priceAtBuy) {
		this.priceAtBuy = priceAtBuy;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public ProductDTO getProduct() {
		return product;
	}
	public void setProduct(ProductDTO product) {
		this.product = product;
	}
}
