package com.shoponline.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}

}
