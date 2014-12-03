package com.creditmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creditmanager.service.PersonService;
import com.creditmanager.service.dto.PersonDTO;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/persons", method = RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody List<PersonDTO> getAll(){
		List<PersonDTO> persons = personService.getAll();
		return persons;
	}
}
