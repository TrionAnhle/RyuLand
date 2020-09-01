package com.ryuland.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "productControllerOfAdmin")
public class ProductController {
	
	@RequestMapping(value = "/quan-tri/san-pham/danh-sach", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/product/list");
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/san-pham/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editPage() {
		ModelAndView mav = new ModelAndView("admin/product/edit");
		return mav;
	}
	
}
