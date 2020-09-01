package com.ryuland.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity{
	@Column(name = "name")
	private String name;

	@Column(name = "code")
	private String code;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "pathimage")
	private String pathImage;
	
	@Column(name = "price")
	private Long price;
	
	@Column(name = "discount")
	private float discount;
	
	@Column(name = "quantity")
	private Long quantity;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	CategoryEntity category;
	
	@OneToMany(mappedBy = "product")
	private List<TransactionDetailEntity> transactionDetails = new ArrayList<>();
	
	@OneToMany(mappedBy = "product")
	private List<ItemCart> itemCarts = new ArrayList<>();
	
	
	
	
	public List<TransactionDetailEntity> getTransactionDetails() {
		return transactionDetails;
	}

	public void setTransactionDetails(List<TransactionDetailEntity> transactionDetails) {
		this.transactionDetails = transactionDetails;
	}

	public List<ItemCart> getItemCarts() {
		return itemCarts;
	}

	public void setItemCarts(List<ItemCart> itemCarts) {
		this.itemCarts = itemCarts;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
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
}
