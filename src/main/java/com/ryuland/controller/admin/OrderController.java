package com.ryuland.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.OrderDTO;
import com.ryuland.service.IOrderService;
import com.ryuland.util.MessageUtils;

@Controller(value = "orderControllerOfAdmin")
public class OrderController {
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private MessageUtils messageUtils;
	
	@RequestMapping(value = "/quan-tri/don-hang/danh-sach", method = RequestMethod.GET)
	public ModelAndView listPage() {
		ModelAndView mav = new ModelAndView("admin/order/list");
		OrderDTO model = new OrderDTO();
		model.setListResult(orderService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/don-hang/chi-tiet", method = RequestMethod.GET)
	public ModelAndView detailOrderPage(@RequestParam("id")Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/order/detail");
		OrderDTO model = orderService.findOne(id);
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtils.getMessage(request.getParameter("message"));
			mav.addObject("alert", message.get("alert"));
			mav.addObject("message", message.get("message"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
}
