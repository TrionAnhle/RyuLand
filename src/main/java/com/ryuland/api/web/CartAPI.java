package com.ryuland.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.CartDTO;
import com.ryuland.service.ICartService;

@RestController(value = "cartAPIOfWeb")
public class CartAPI {
	
	@Autowired
	private ICartService cartService;
	
	@PostMapping("/api/web/cart")
	public ResponseEntity<CartDTO> saveItemCart(@RequestBody CartDTO dto) {
		CartDTO saveDto = cartService.saveItem(dto);
		return new ResponseEntity<CartDTO>(saveDto, HttpStatus.OK);
	}
	
	@DeleteMapping("/api/web/cart")
	public  ResponseEntity<Void> deleteItemCart(@RequestBody CartDTO dto) {
		cartService.delete(dto);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/api/web/cart")
	public ResponseEntity<CartDTO> updateCart(@RequestBody CartDTO dto){
		CartDTO saveDto = cartService.updateItem(dto);
		return new ResponseEntity<CartDTO>(saveDto, HttpStatus.OK);
	}
}
