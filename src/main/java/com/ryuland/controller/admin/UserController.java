package com.ryuland.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.UserDTO;
import com.ryuland.service.IUserService;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = "/quan-tri/nguoi-dung/danh-sach", method = RequestMethod.GET)
	public ModelAndView listPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/user/list");
		UserDTO model = new UserDTO();
		model.setListResult(userService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/nguoi-dung/them-moi", method = RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/user/register");
		UserDTO model = new UserDTO();
		model.setListResult(userService.findAll());
		mav.addObject("model", model);
		return mav;
	}
}
