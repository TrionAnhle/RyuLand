package com.ryuland.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.CategoryDTO;
import com.ryuland.service.ICategoryService;
import com.ryuland.util.MessageUtils;

@Controller(value = "categoryControllerOfAdmin")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private MessageUtils messageUtils;
	
	@RequestMapping(value = "/quan-tri/the-loai", method = RequestMethod.GET)
	public ModelAndView listPage(@RequestParam(value = "id", required = false) Long id,
															HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/category/list");
		CategoryDTO model = new CategoryDTO();
		model.setListResult(categoryService.findAll());
		if(id != null) {
			CategoryDTO modelEdit = categoryService.findById(id);
			mav.addObject("modelEdit", modelEdit);
		}
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtils.getMessage(request.getParameter("message"));
			mav.addObject("alert", message.get("alert"));
			mav.addObject("message", message.get("message"));
		}
		mav.addObject("model",model);
		return mav;
	}
	
}
