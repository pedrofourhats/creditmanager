package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value="/")
    public String index(Model model) {
        return home(model);
    }
	
	@RequestMapping(value="/home")
    public String home(Model model) {
		return "content/project/index";
    }
}
