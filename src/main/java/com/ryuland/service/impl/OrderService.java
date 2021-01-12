package com.ryuland.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ryuland.converter.OrderConverter;
import com.ryuland.converter.ProductConverter;
import com.ryuland.dto.OrderDTO;
import com.ryuland.dto.OrderDetailDTO;
import com.ryuland.entity.ItemCart;
import com.ryuland.entity.TransactionDetailEntity;
import com.ryuland.entity.TransactionEntity;
import com.ryuland.entity.TransactionProductId;
import com.ryuland.entity.UserEntity;
import com.ryuland.entity.UserProductId;
import com.ryuland.repository.ICartRepository;
import com.ryuland.repository.IOrderDetailRepository;
import com.ryuland.repository.IOrderRepository;
import com.ryuland.repository.IProductRepository;
import com.ryuland.repository.UserRepository;
import com.ryuland.service.IOrderService;
import com.ryuland.util.SecurityUtils;

@Service
public class OrderService implements IOrderService{
	
	@Autowired
	private IOrderDetailRepository orderDetailRepository;
	
	@Autowired
	private IOrderRepository orderRepository;
	
	@Autowired
	private OrderConverter orderConverter;
	
	@Autowired
	private IProductRepository productRepository;
	
	@Autowired
	private ProductConverter productConverter;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ICartRepository cartRepository;

	@Override
	public List<OrderDTO> findAll() {
		List<TransactionEntity> entities = orderRepository.findAll(new Sort(Sort.Direction.DESC, "createdDate"));
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
		Long totalQuantity = 0L;
		for(TransactionDetailEntity i : detailsOrderEntity) {
			OrderDetailDTO orderDetail = new OrderDetailDTO();
			totalQuantity+=(i.getQuantity());
			orderDetail.setQuantity(i.getQuantity());
			orderDetail.setPriceAtBuy(i.getPriceAtBuy());
			orderDetail.setProduct(productConverter.toDTO(i.getProduct()));
			detailsOrderDto.add(orderDetail);
		}
		dto.setTotalQuantity(totalQuantity);
		dto.setTotalOrder(entity.getTotal());
		dto.setProducts(detailsOrderDto);
		return dto;
	}

	@Override
	@Transactional
	public OrderDTO update(OrderDTO update) {
		TransactionEntity oldOrderEntity = orderRepository.findOne(update.getId());
		
		if(!update.getPhone().equals(oldOrderEntity.getPhone())) {
			oldOrderEntity.setPhone(update.getPhone());
		}
		if(!update.getAddress().equals(oldOrderEntity.getAddress())) {
			oldOrderEntity.setAddress(update.getAddress());
		}
		if(!update.getStatus().equals(oldOrderEntity.getStatus())) {
			oldOrderEntity.setStatus(update.getStatus());
		}
		return orderConverter.toDto(orderRepository.save(oldOrderEntity));
	}

	@Override
	@Transactional
	public OrderDTO save(OrderDTO dto) {
		Long userId = SecurityUtils.getPrincipal().getId();
		UserEntity user = userRepository.findOne(userId);
		
		TransactionEntity entity = new TransactionEntity();
		
		if(user.getItemCarts().size()<=0) {
			new Exception();return null;
		}
		
		entity.setUser(user);
		entity.setStatus("1");
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity = orderRepository.save(entity);
		
		// add item cart to order
		Long totalShip= 0L, totalBuy=0L;
		for(ItemCart i : user.getItemCarts()) {
			TransactionDetailEntity itemDetail = new TransactionDetailEntity();
			if(i.getQuantity() <= i.getProduct().getQuantity() 
					&& i.getQuantity() > 0) {
				itemDetail.setPriceAtBuy(i.getProduct().getPrice() - (i.getProduct().getPrice()*i.getProduct().getDiscount())/100);
				itemDetail.setQuantity(i.getQuantity());
				itemDetail.setTransaction(entity);
				itemDetail.setProduct(i.getProduct());
				itemDetail.setId(new TransactionProductId(entity.getId(),i.getProduct().getId()));
				
				orderDetailRepository.save(itemDetail);
				i.getProduct().setQuantity(i.getProduct().getQuantity() - i.getQuantity());
				productRepository.save(i.getProduct());
				
				totalBuy+=(itemDetail.getQuantity()*itemDetail.getPriceAtBuy());
				totalShip+=(itemDetail.getQuantity()*10000);
			}
			cartRepository.delete(new UserProductId(user.getId(),i.getProduct().getId()));
		}
		entity.setTotal(totalShip+totalBuy);
		return orderConverter.toDto(orderRepository.save(entity));
	}

	@Override
	public List<OrderDTO> findAllByUser() {
		Long userId = SecurityUtils.getPrincipal().getId();
		List<TransactionEntity> entities = orderRepository.findAllByUserId(userId);
		List<OrderDTO> orders = new ArrayList<OrderDTO>();
		for(TransactionEntity i : entities) {
			OrderDTO order = orderConverter.toDto(i);
			order.setTotalOrder(i.getTotal());
			orders.add(order);
		}
		return orders;
	}

	@Override
	public Long getTotalOrderByStatus(int status) {
		long total = 0L;
		List<TransactionEntity> etities = orderRepository.findAll();
		for(TransactionEntity i : etities) {
			if(i.getStatus().equalsIgnoreCase(String.valueOf(status))) ++total;
		}
		return total;
	}

}