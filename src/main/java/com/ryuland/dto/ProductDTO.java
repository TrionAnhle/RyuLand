package com.ryuland.dto;

public class ProductDTO extends AbstractDTO<ProductDTO>{
	
	private String name;
	private String code;
	private String description;
	private String pathImage;
	private String base64;
	private Long price;
	private float discount;
	private Long quantity;
	private Long categoryId;
	private String categoryCode;
	
	
	

	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getBase64() {
		return this.base64;
	}
	public void setBase64(String base64) {
		this.base64 = base64;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPathImage() {
		return pathImage;
	}
	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
//	public CategoryDTO getCategory() {
//		return category;
//	}
//	public void setCategory(CategoryDTO category) {
//		this.category = category;
//	}
	
	
}
