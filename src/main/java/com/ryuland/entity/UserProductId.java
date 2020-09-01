package com.ryuland.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UserProductId implements Serializable{

	private static final long serialVersionUID = -9197397059069562490L;
	
	@Column(name = "user_id")
	private Long userId;
	
	@Column(name = "product_id")
	private Long productId;
	
}
