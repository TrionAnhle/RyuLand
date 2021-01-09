package com.ryuland.service;

import com.ryuland.dto.CartDTO;

public interface ICartService {
	CartDTO findAllItemByUserId();
	CartDTO saveItem(CartDTO dto);
	void delete(CartDTO dto);
}
