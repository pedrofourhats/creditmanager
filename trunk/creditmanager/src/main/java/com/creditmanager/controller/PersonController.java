package com.creditmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creditmanager.service.PersonService;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;
	
//	@RequestMapping(value="/persons", method = RequestMethod.GET, headers="Accept=*/*")
//	public @ResponseBody List<PersonDTO> getAll(){
//		List<PersonDTO> persons = personService.getAll();
//		return persons;
//	}
	
	@RequestMapping(value="/person/list")
    public String goToList(Model model) {
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
}