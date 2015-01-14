package com.creditmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creditmanager.service.ProjectService;
import com.google.gson.Gson;

@Controller
public class FormController {

	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value="/form")
    public String goToForm(Model model) {
        return "content/form/index";
    }
	
	@RequestMapping(value="/forms/{formName}/{projectId}")
    public String goToForm1(@PathVariable String formName, @PathVariable long projectId, Model model) {
		Gson gson = new Gson();
		model.addAttribute("project", gson.toJson(projectService.getById(projectId)));
		
        return "content/form/" + formName;
    }
}