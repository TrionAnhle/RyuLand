package com.ryuland.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.CartDTO;
import com.ryuland.dto.HomeDTO;
import com.ryuland.dto.OrderDTO;
import com.ryuland.dto.ProductDTO;
import com.ryuland.service.ICartService;
import com.ryuland.service.IOrderService;
import com.ryuland.service.IProductService;
import com.ryuland.util.MessageUtils;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private IProductService productService;

	@Autowired
	private ICartService cartService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private MessageUtils messageUtils;
	
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
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("register");
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
	
	// thao tac thong tin voi nguoi dung
	@RequestMapping(value = "/gio-hang", method = RequestMethod.GET)
	public ModelAndView cartPage() {
		ModelAndView mav = new ModelAndView("web/cart");
		CartDTO dto = cartService.findAllItemByUserId();
		dto.getTotal();
		mav.addObject("cart", dto);
		return mav;
	}
	
	@RequestMapping(value = "/don-hang", method = RequestMethod.GET)
	public ModelAndView orderPage() {
		ModelAndView mav = new ModelAndView("web/order");
		CartDTO dto = cartService.findAllItemByUserId();
		dto.getTotal();
		mav.addObject("cart", dto);
		return mav;
	}
	
	@RequestMapping(value = "/don-hang/danh-sach", method = RequestMethod.GET)
	public ModelAndView listOrderPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/listorder");
		OrderDTO model = new OrderDTO();
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtils.getMessage(request.getParameter("message"));
			mav.addObject("alert", message.get("alert"));
			mav.addObject("message", message.get("message"));
		}
		model.setListResult(orderService.findAllByUser());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/don-hang/chi-tiet", method = RequestMethod.GET)
	public ModelAndView detailOrderPageWeb(@RequestParam("id")Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/detailorder");
		OrderDTO model = orderService.findOne(id);
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/san-pham/danh-sach", method = RequestMethod.GET)
	public ModelAndView listProductPage(@RequestParam("ten")String name) {
		ModelAndView mav = new ModelAndView("web/listproduct");
		ProductDTO model = new ProductDTO();
		model.setListResult(productService.findAllByCategory(name));
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/san-pham/danh-sach/tim-kiem", method = RequestMethod.GET)
	public ModelAndView listProudctKeyPage(@RequestParam("key")String key) {
		ModelAndView mav = new ModelAndView("web/listproduct");
		ProductDTO model = new ProductDTO();
		model.setListResult(productService.findAllByKey(key));
		mav.addObject("model", model);
		return mav;
	}
	
}
