package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

	@RequestMapping(value="/singin")
	public String singin(ModelMap model){
		return "login";
	}
	
	@RequestMapping(value="/admin/users")
	public String users(ModelMap model){
		return "/admin/user";
	}
}
