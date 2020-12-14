package com.ryuland.dto;

import java.util.Date;
import java.util.List;

public class OrderDTO extends AbstractDTO<OrderDTO>{
	private String status;
	private String phone;
	private String address;
	private String fullname;
	
	private Long totalOrder;
	private Date createdDate;
	private List<OrderDetailDTO> products;
	
	public Long getTotalOrder() {
		return totalOrder;
	}
	public void setTotalOrder(Long totalOrder) {
		this.totalOrder = totalOrder;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public List<OrderDetailDTO> getProducts() {
		return products;
	}
	public void setProducts(List<OrderDetailDTO> products) {
		this.products = products;
	}
}
