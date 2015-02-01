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
	
	@RequestMapping(value="/project/quoteDetail")
	public String goToQuoteDetail(Model model){
		return "content/project/quoteDetail";
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
