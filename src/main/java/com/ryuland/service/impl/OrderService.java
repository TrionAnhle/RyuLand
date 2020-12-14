package com.ryuland.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.internal.CriteriaImpl.OrderEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryuland.converter.OrderConverter;
import com.ryuland.converter.ProductConverter;
import com.ryuland.dto.OrderDTO;
import com.ryuland.dto.OrderDetailDTO;
import com.ryuland.entity.TransactionDetailEntity;
import com.ryuland.entity.TransactionEntity;
import com.ryuland.repository.IOrderDetailRepository;
import com.ryuland.repository.IOrderRepository;
import com.ryuland.repository.UserRepository;
import com.ryuland.service.IOrderService;

@Service
public class OrderService implements IOrderService{
	
	@Autowired
	private IOrderDetailRepository orderDetailRepository;
	
	@Autowired
	private IOrderRepository orderRepository;
	
	@Autowired
	private OrderConverter orderConverter;
	
	@Autowired
	private ProductConverter productConverter;
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public List<OrderDTO> findAll() {
		List<TransactionEntity> entities = orderRepository.findAll();
		List<OrderDTO> orders = new ArrayList<OrderDTO>();
		for(TransactionEntity i : entities) {
			OrderDTO order = orderConverter.toDto(i);
			orders.add(order);
		}
		return orders;
	}

	@Override
	public OrderDTO findOne(Long id) {
		TransactionEntity entity = orderRepository.findOne(id);
		OrderDTO dto = orderConverter.toDto(entity);
		
		List<TransactionDetailEntity> detailsOrderEntity = orderDetailRepository.finAllById(id);
		List<OrderDetailDTO> detailsOrderDto = new ArrayList<OrderDetailDTO>();
		Long totalOrder = (long) 0;
		for(TransactionDetailEntity i : detailsOrderEntity) {
			OrderDetailDTO orderDetail = new OrderDetailDTO();
			orderDetail.setQuantity(i.getQuantity());
			orderDetail.setPriceAtBuy(i.getPriceAtBuy());
			totalOrder+=(i.getQuantity()*i.getPriceAtBuy());
			orderDetail.setProduct(productConverter.toDTO(i.getProduct()));
			detailsOrderDto.add(orderDetail);
		}
		dto.setTotalOrder(totalOrder);
		dto.setProducts(detailsOrderDto);
		return dto;
	}

	@Override
	public OrderDTO save(OrderDTO update) {
		TransactionEntity oldOrderEntity = orderRepository.findOne(update.getId());
		TransactionEntity newOrderEntity = new TransactionEntity();
		newOrderEntity = orderConverter.toEntity(oldOrderEntity, update);	
		
		newOrderEntity.setTotal(oldOrderEntity.getTotal());
		newOrderEntity.setUser(oldOrderEntity.getUser());
		newOrderEntity.setCreatedDate(oldOrderEntity.getCreatedDate());
		newOrderEntity.setCreatedBy(oldOrderEntity.getCreatedBy());
		
		return orderConverter.toDto(orderRepository.save(newOrderEntity));
	}

}