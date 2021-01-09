package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.ProductDTO;

public interface IProductService {
	List<ProductDTO> findAll();
	List<ProductDTO> findListByTime();
	List<ProductDTO> findListByBuy();
	List<ProductDTO> findListByDiscount();
	ProductDTO findById(Long id);
	ProductDTO save(ProductDTO dto);
	void delete(Long id);
}
