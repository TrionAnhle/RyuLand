package com.ryuland.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "transaction")
public class TransactionEntity extends BaseEntity{
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "total")
	private Long total;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	@OneToMany(mappedBy = "transaction")
	private List<TransactionDetailEntity> transactionDetails = new ArrayList<>();

	
	
	public List<TransactionDetailEntity> getTransactionDetails() {
		return transactionDetails;
	}

	public void setTransactionDetails(List<TransactionDetailEntity> transactionDetails) {
		this.transactionDetails = transactionDetails;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoneTransaction() {
		return phone;
	}

	public void setPhoneTransaction(String phoneTransaction) {
		this.phone = phoneTransaction;
	}

	public String getAddressTransaction() {
		return address;
	}

	public void setAddressTransaction(String addressTransaction) {
		this.address = addressTransaction;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	
}
