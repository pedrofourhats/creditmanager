package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	@RequestMapping(value="/report")
    public String goToReport(Model model) {
        return "content/report/index";
    }
}
