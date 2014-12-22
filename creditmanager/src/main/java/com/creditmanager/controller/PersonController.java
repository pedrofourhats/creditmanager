package com.creditmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creditmanager.service.PersonService;
import com.google.gson.Gson;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/person/list")
    public String goToList(Model model) {
		Gson gson = new Gson();
		model.addAttribute("personsPage", gson.toJson(personService.getAllPerson(1, 10, null)));
		return "content/person/list";
    }
	
	@RequestMapping(value="/person/detail")
    public String goToDetail(Model model) {
		return "content/person/detail";
    }
	
	@RequestMapping(value="/person/create")
    public String goToPersonCreation(Model model) {
		return "content/person/create";
    }
	
	@RequestMapping("/person/edit/{personId}")
	public String goToPersonEdition(@PathVariable long personId, Model model) {
		Gson gson = new Gson();
		model.addAttribute("editablePerson", gson.toJson(personService.getById(personId)));
		return "content/person/create";
    }
}
