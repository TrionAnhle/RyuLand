package com.ryuland.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.ProductDTO;
import com.ryuland.service.IProductService;

@RestController(value = "productAPIOfWeb")
public class ProductAPI {
	
	@Autowired
	private IProductService productService;
	
	@GetMapping("/api/web/product")
	public ProductDTO getProduct(@RequestParam("id") long id) {
		return productService.findById(id);
	}
}
