package com.shoponline.controller.web;

import java.util.ArrayList;
import java.util.List;

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

import com.shoponline.dto.CategoryDTO;
import com.shoponline.dto.ItemDTO;
import com.shoponline.service.ICategoryService;
import com.shoponline.service.IItemService;

@Controller
public class HomeController {
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IItemService itemService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		CategoryDTO categoryModel = new CategoryDTO();
		List<CategoryDTO> categoryDTOs =categoryService.findAllList();
		categoryModel.setListResult(categoryDTOs);
		List<ItemDTO> itemModel = new ArrayList<ItemDTO>();
		for(int i = 0;i < categoryDTOs.size(); i++) {
			ItemDTO item = new ItemDTO();
			item.setListResult(itemService.findItemByCode(categoryDTOs.get(i).getCode()));
			
			itemModel.add(i, item);	
		}
		mav.addObject("itemModel", itemModel);
		mav.addObject("categorymodel", categoryModel);
		return mav;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null)
			new SecurityContextLogoutHandler().logout(request, response, auth);

		return new ModelAndView("redirect:/home");
	}
}
