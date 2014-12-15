package com.creditmanager.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.model.Page;
import com.creditmanager.service.PersonService;
import com.creditmanager.service.dto.PersonDTO;

@RestController
public class PersonRestController {
	
	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/persons/getAll", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<PersonDTO> getAll(int pageIndex, int pageSize){
		Page<PersonDTO> persons = personService.getAllPerson(pageIndex, pageSize);
		return persons;
	}
	
	@RequestMapping(value="/persons/createPerson", method = RequestMethod.POST)
	public @ResponseBody void addPerson(@RequestBody PersonDTO person){
		personService.addPerson(person);
	}
	
	@RequestMapping(value="/persons", method = RequestMethod.PUT)
	public @ResponseBody void editPerson(PersonDTO person){
		personService.editPerson(person);
	}
}
