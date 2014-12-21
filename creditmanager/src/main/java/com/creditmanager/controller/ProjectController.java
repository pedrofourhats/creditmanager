package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController  {
	
	@RequestMapping(value="/project/list")
    public String goToList(Model model) {
		return "content/project/index";
    }
	
	@RequestMapping(value="/project/detail")
    public String goToDetail(Model model) {
		return "content/project/detail";
    }
	
//	@RequestMapping(value="/project/create")
//    public String goToProjectCreation(Model model) {
//		return "content/project/create";
//    }
	
	@RequestMapping(value="/project/listHtml")
	public String projectList(Model model){
		return "redirect:/pages/project-list.html";
	}
	
	@RequestMapping(value="/project/create")
	public String goToProjectCreation(Model model){
		return "redirect:/pages/project-create.html";
	}
}
