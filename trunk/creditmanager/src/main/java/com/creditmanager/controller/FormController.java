package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FormController {

	@RequestMapping(value="/form")
    public String goToForm(Model model) {
        return "content/form/index";
    }
}