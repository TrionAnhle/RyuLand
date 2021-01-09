package com.ryuland.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.CartDTO;
import com.ryuland.dto.HomeDTO;
import com.ryuland.service.ICartService;
import com.ryuland.service.IProductService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private IProductService productService;

	@Autowired
	private ICartService cartService;
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		HomeDTO model = new HomeDTO();
		model.setListNew(productService.findListByTime());	
		model.setListHot(productService.findListByDiscount());
		model.setListBestSeller(productService.findListByBuy());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
	
	@RequestMapping(value = "/gio-hang", method = RequestMethod.GET)
	public ModelAndView cartPage() {
		ModelAndView mav = new ModelAndView("web/cart");
		CartDTO dto = cartService.findAllItemByUserId();
		dto.getTotal();
		mav.addObject("cart", dto);
		return mav;
	}
}
