package com.ryuland.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "transactiondetail")
public class TransactionDetailEntity {
	
	@EmbeddedId
	private TransactionProductId id;
	
	@ManyToOne
	@MapsId("transactionId")
	private TransactionEntity transaction;
	
	@ManyToOne
	@MapsId("productId")
	private ProductEntity product;
	
	@Column(name = "quantity")
	private Long quantity;

	public TransactionProductId getId() {
		return id;
	}

	public void setId(TransactionProductId id) {
		this.id = id;
	}

	public TransactionEntity getTransaction() {
		return transaction;
	}

	public void setTransaction(TransactionEntity transaction) {
		this.transaction = transaction;
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
