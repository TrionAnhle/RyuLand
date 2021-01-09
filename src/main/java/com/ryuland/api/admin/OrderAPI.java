package com.ryuland.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.OrderDTO;
import com.ryuland.service.IOrderService;

@RestController(value = "orderAPIOfAdmin")
public class OrderAPI {
	
	@Autowired
	private IOrderService orderService;
	
	@PutMapping(value = "/api/order")
	public ResponseEntity<OrderDTO> updateOrder(@RequestBody OrderDTO updateOrder){
		OrderDTO dto = orderService.save(updateOrder);
		return new ResponseEntity<OrderDTO>(dto, HttpStatus.OK);
	}
	
}
