package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.OrderDTO;

public interface IOrderService {
	List<OrderDTO> findAll();
	OrderDTO findOne(Long id);
	OrderDTO save(OrderDTO update);
}
