package com.ryuland.dto;

public class CategoryDTO extends AbstractDTO<CategoryDTO>{
	
	private String name;
	private String code;
	
	private Long soMau;
	
	
	public Long getSoMau() {
		return soMau;
	}
	public void setSoMau(Long soMau) {
		this.soMau = soMau;
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
}
