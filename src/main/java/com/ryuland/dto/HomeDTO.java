package com.ryuland.dto;

import java.util.List;

public class HomeDTO {
	
	private List<ProductDTO> listNew;
	private List<ProductDTO> listHot;
	private List<ProductDTO> listBestSeller;
	
	
	public List<ProductDTO> getListBestSeller() {
		return listBestSeller;
	}
	public void setListBestSeller(List<ProductDTO> listBestSeller) {
		this.listBestSeller = listBestSeller;
	}
	public List<ProductDTO> getListNew() {
		return listNew;
	}
	public void setListNew(List<ProductDTO> listNew) {
		this.listNew = listNew;
	}
	public List<ProductDTO> getListHot() {
		return listHot;
	}
	public void setListHot(List<ProductDTO> listHot) {
		this.listHot = listHot;
	}
}
