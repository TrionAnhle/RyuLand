package com.ryuland.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.CategoryDTO;
import com.ryuland.service.ICategoryService;

@Controller(value = "categoryControllerOfAdmin")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/quan-tri/the-loai", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/category/list");
		CategoryDTO model = new CategoryDTO();
		model.setListResult(categoryService.findAll());
		if(id != null) {
			CategoryDTO modelEdit = categoryService.findById(id);
			mav.addObject("modelEdit", modelEdit);
		}
		mav.addObject("model",model);
		return mav;
	}
	
}
