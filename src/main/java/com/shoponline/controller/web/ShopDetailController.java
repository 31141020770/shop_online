package com.shoponline.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shoponline.dto.CardDTO;
import com.shoponline.dto.ItemDTO;
import com.shoponline.dto.MyUser;
import com.shoponline.service.ICardService;
import com.shoponline.service.IItemService;
import com.shoponline.util.SecurityUtils;

@Controller
public class ShopDetailController {
	@Autowired
	private IItemService itemService;
	@Autowired
	private ICardService cardService;
	@RequestMapping(value = "/home/shop", method = RequestMethod.GET)
	public ModelAndView shopDetailPage() {
		ModelAndView mav = new ModelAndView("web/shopdetails");
		return mav;
	}
	@RequestMapping(value = "/home/shop/{id}", method = RequestMethod.GET)
	public ModelAndView itemDetailPage(@PathVariable long id) {
		ModelAndView mav = new ModelAndView("web/itemdetails");
		ItemDTO itemDTO = itemService.findbyId(id);
		mav.addObject("models", itemDTO);
		return mav;
	}
	@RequestMapping(value = "/customer/shopcard", method = RequestMethod.GET)
	public ModelAndView shopCardPage() {
		ModelAndView mav = new ModelAndView("web/shopcard");
		
		MyUser myUser = SecurityUtils.getPrincipal();
		String userName = myUser.getUsername();
		List<CardDTO> cardDTOs = cardService.findCardByUseNameAndOrderStatus(userName, 1);
		mav.addObject("models", cardDTOs);
		return mav;
	}

	/*
	 * @RequestMapping(value = "/customer/shopcard/count") public ModelAndView
	 * countItemPage(@RequestParam int ) { ModelAndView mav = new
	 * ModelAndView("web/shopcard");
	 * 
	 * MyUser myUser = SecurityUtils.getPrincipal(); String userName =
	 * myUser.getUsername(); List<CardDTO> cardDTOs =
	 * cardService.findCardByUseNameAndOrderStatus(userName, 1);
	 * mav.addObject("models", cardDTOs); return mav; }
	 */
	@RequestMapping(value = "/customer/{id}")
	public ModelAndView addItemToCard(@PathVariable long id, HttpServletRequest request) {
		MyUser myUser = SecurityUtils.getPrincipal();
		String user = myUser.getUsername();
		cardService.save(id, user);
		return new ModelAndView("redirect:/customer/shopcard");
	}
}
