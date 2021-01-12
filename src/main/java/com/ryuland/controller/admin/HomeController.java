package com.ryuland.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.constant.SystemConstant;
import com.ryuland.service.IOrderService;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	@Autowired
	private IOrderService orderService;

	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		mav.addObject("numNotConfirm", orderService.getTotalOrderByStatus(SystemConstant.STATUS_ORDER_NOT_CONFIRM));
		mav.addObject("numConfirm", orderService.getTotalOrderByStatus(SystemConstant.STATUS_ORDER_CONFIRM));
		mav.addObject("numShip", orderService.getTotalOrderByStatus(SystemConstant.STATUS_ORDER_SHIP));
		mav.addObject("numSuccess", orderService.getTotalOrderByStatus(SystemConstant.STATUS_ORDER_SUCCESS));
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/tai-khoan", method = RequestMethod.GET)
	public ModelAndView accountPage() {
		ModelAndView mav = new ModelAndView("admin/account");
		return mav;
	}
	
}
