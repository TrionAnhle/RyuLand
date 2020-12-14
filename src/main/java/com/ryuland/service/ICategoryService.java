package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.CategoryDTO;

public interface ICategoryService {
	List<CategoryDTO> findAll();
	CategoryDTO findById(Long id);
	CategoryDTO save(CategoryDTO categoryDTO);
	void delete(long id);
}
