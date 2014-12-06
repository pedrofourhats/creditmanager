package com.creditmanager.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.service.PersonService;
import com.creditmanager.service.dto.PersonDTO;

@RestController
public class PersonRestController {
	
	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/persons", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<PersonDTO> getAll(){
		List<PersonDTO> persons = personService.getAll();
		return persons;
	}
	
	@RequestMapping(value="/persons", method = RequestMethod.POST)
	public @ResponseBody void addPerson(PersonDTO person){
		personService.addPerson(person);
	}
	
	@RequestMapping(value="/persons", method = RequestMethod.PUT)
	public @ResponseBody void editPerson(PersonDTO person){
		personService.editPerson(person);
	}
}
