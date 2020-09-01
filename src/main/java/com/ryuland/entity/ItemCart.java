package com.ryuland.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "itemcart")
public class ItemCart {
	@EmbeddedId
	private UserProductId id;
	
	@ManyToOne
	@MapsId("userId")
	private UserEntity user;
	
	@ManyToOne
	@MapsId("productId")
	private ProductEntity product;
	
	@Column(name = "quantity")
	private Long quantity;

	public UserProductId getId() {
		return id;
	}

	public void setId(UserProductId id) {
		this.id = id;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public ProductEntity getProduct() {
		return product;
	}

	public void setProduct(ProductEntity product) {
		this.product = product;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
