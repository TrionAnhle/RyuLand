package com.ryuland.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ryuland.dto.CartDTO;
import com.ryuland.dto.CategoryDTO;
import com.ryuland.service.ICartService;
import com.ryuland.service.ICategoryService;

public class LoadCart implements HandlerInterceptor{
	
	@Autowired
	private ICartService cartService;
	
	@Autowired
	private ICategoryService categoryService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			CartDTO dto = cartService.findAllItemByUserId();
			request.setAttribute("cart", dto);
		}
		long size = categoryService.getTotal();
		int limit1=categoryService.getTotal()/3;
		int limit2=limit1;int limit3=limit1;
		if(size%3>=1) ++limit2;
		if(size%3>=2) ++limit3;
		List<CategoryDTO> category1 = categoryService.findAllByPage(0, limit1);
		List<CategoryDTO> category2 = categoryService.findAllByPage(limit1, limit2);
		List<CategoryDTO> category3 = categoryService.findAllByPage(limit1+limit2, limit3);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("category3", category3);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}
