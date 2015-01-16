package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	@RequestMapping(value="/report/list")
    public String goToList(Model model) {
        return "content/report/list";
    }
	
	@RequestMapping(value="/report/defaulters")
    public String goToDefaulters(Model model) {
        return "content/report/defaulters";
    }
}