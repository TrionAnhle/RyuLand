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
	
}
