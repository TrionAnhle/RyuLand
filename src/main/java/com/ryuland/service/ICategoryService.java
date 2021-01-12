package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.CategoryDTO;

public interface ICategoryService {
	List<CategoryDTO> findAll();
	List<CategoryDTO> findAllByPage(long offset, long limit);
	CategoryDTO findById(Long id);
	int getTotal();
	CategoryDTO save(CategoryDTO categoryDTO);
	void delete(long id);
}
