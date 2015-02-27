package com.creditmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.ProjectDTO;
import com.google.gson.Gson;

@Controller
public class ProjectController  {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value="/project/list")
    public String goToList(Model model) {
		return "content/project/index";
    }
	
	@RequestMapping(value="/project/detail")
    public String goToDetail(Model model) {
		return "content/project/detail";
    }
	
	@RequestMapping(value="/project/paymentCalendar/{projectId}")
	public String goToQuoteDetail(@PathVariable long projectId, Model model){
		ProjectDTO project = projectService.getById(projectId);
		Gson serializer = new Gson();
		model.addAttribute("project", serializer.toJson(project));
		return "content/project/paymentCalendar";
	}
	
	@RequestMapping(value="/project/collectionsManagement")
	public String goToCollectionsManagement(Model model){
		return "content/project/collectionsManagement";
	}
	
	@RequestMapping(value="/project/simpleCollectionsAndPole")
	public String goToSimpleCollectionsAndPole(Model model){
		return "content/project/simpleCollectionsAndPole";
	}
	
//	@RequestMapping(value="/project/create")
//    public String goToProjectCreation(Model model) {
//		return "content/project/create";
//    }
}
