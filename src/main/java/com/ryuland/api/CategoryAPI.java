package com.ryuland.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.CategoryDTO;
import com.ryuland.service.ICategoryService;

@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {
	
	@Autowired
	private ICategoryService categoryService;
	
	@GetMapping("/api/category")
	public CategoryDTO getCategory(@RequestParam("id") long id) {
		return categoryService.findById(id);
	}
	
	@PostMapping("/api/category")
	public CategoryDTO createCategory(@RequestBody CategoryDTO newCategory) {
		return categoryService.save(newCategory);
	}
	
	@PutMapping("/api/category")
	public CategoryDTO updateCategory(@RequestBody CategoryDTO updateCategory) {
		return categoryService.save(updateCategory);
	}
	
	@DeleteMapping("/api/category")
	public void deleteCategory(@RequestBody CategoryDTO category) {
		categoryService.delete(category.getId());
	}
	
	
}
