package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.ProductDTO;

public interface IProductService {
	List<ProductDTO> findAll();
	ProductDTO findById(Long id);
	ProductDTO save(ProductDTO dto);
	void delete(Long id);
}
