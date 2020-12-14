package com.ryuland.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.ProductDTO;
import com.ryuland.service.ICategoryService;
import com.ryuland.service.IProductService;
import com.ryuland.util.MessageUtils;

@Controller(value = "productControllerOfAdmin")
public class ProductController {
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private MessageUtils messageUtils;
	
	
	@RequestMapping(value = "/quan-tri/san-pham/danh-sach", method = RequestMethod.GET)
	public ModelAndView listPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/product/list");
		ProductDTO model = new ProductDTO();
		model.setListResult(productService.findAll());
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtils.getMessage(request.getParameter("message"));
			mav.addObject("alert", message.get("alert"));
			mav.addObject("message", message.get("message"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = {"/quan-tri/san-pham/them-moi","/quan-tri/san-pham/chinh-sua"}
									, method = RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/product/edit");
		ProductDTO model = new ProductDTO();
		if(request.getParameter("id") != null) {
			Long id = Long.valueOf(request.getParameter("id"));
			model = productService.findById(id);
		}
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtils.getMessage(request.getParameter("message"));
			mav.addObject("alert", message.get("alert"));
			mav.addObject("message", message.get("message"));
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
}
