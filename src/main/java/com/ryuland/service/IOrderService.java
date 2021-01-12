package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.OrderDTO;

public interface IOrderService {
	List<OrderDTO> findAll();
	List<OrderDTO> findAllByUser();
	OrderDTO findOne(Long id);
	OrderDTO save(OrderDTO dto);
	OrderDTO update(OrderDTO update);
}
