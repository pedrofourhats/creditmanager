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
	
	@RequestMapping(value="/forms/form1")
    public String goToForm1(Model model) {
        return "content/form/form1";
    }
	
	@RequestMapping(value="/forms/form2")
    public String goToForm2(Model model) {
        return "content/form/form2";
    }
	
	@RequestMapping(value="/forms/form3")
    public String goToForm3(Model model) {
        return "content/form/form3";
    }
	
	@RequestMapping(value="/forms/form4")
    public String goToForm4(Model model) {
        return "content/form/form4";
    }
	
	@RequestMapping(value="/forms/form5")
    public String goToForm5(Model model) {
        return "content/form/form5";
    }
}