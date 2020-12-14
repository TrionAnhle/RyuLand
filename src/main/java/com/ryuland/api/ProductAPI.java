package com.ryuland.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.ProductDTO;
import com.ryuland.service.IProductService;

@RestController(value = "productAPIOfAdmin")
public class ProductAPI {
	
	@Autowired
	private IProductService productService;

	@PostMapping("/api/product")
	public ResponseEntity<ProductDTO> createProduct(@RequestBody ProductDTO newProduct){
		ProductDTO product = productService.save(newProduct);
		return new ResponseEntity<ProductDTO>(product, HttpStatus.OK);
	}
	
	@PutMapping("/api/product")
	public  ResponseEntity<ProductDTO> updateProduct(@RequestBody ProductDTO updateProduct) {
		ProductDTO product = productService.save(updateProduct);
		return new ResponseEntity<ProductDTO>(product, HttpStatus.OK);
	}
	
	@DeleteMapping("/api/product")
	public  ResponseEntity<Void> deleteProduct(@RequestBody ProductDTO product) {
		productService.delete(product.getId());
		return ResponseEntity.noContent().build();
	}
}
