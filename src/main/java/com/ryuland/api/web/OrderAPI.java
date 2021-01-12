package com.ryuland.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.OrderDTO;
import com.ryuland.service.IOrderService;

@RestController(value = "orderAPIOfWeb")
public class OrderAPI {
	
	@Autowired
	private IOrderService orderService;
	
	@PostMapping(value = "/api/web/order")
	public ResponseEntity<OrderDTO> updateOrder(@RequestBody OrderDTO newDto){
		OrderDTO dto = orderService.save(newDto);
		return new ResponseEntity<OrderDTO>(dto, HttpStatus.OK);
	}
	
	
}
