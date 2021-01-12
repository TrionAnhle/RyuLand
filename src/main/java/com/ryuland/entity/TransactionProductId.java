package com.ryuland.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TransactionProductId implements Serializable{
	private static final long serialVersionUID = 924606988265133249L;
	
	@Column(name = "transaction_id")
	private Long transactionId;
	
	@Column(name = "product_id")
	private Long productId;

	public Long getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(Long transactionId) {
		this.transactionId = transactionId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public TransactionProductId(Long transactionId, Long productId) {
		super();
		this.transactionId = transactionId;
		this.productId = productId;
	}

	public TransactionProductId() {
		super();
	}
	
	
	
}
