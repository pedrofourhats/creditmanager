package com.creditmanager.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="/persons/{pageIndex}/{pageSize}", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<PersonDTO> getAll(@PathVariable int pageIndex, @PathVariable int pageSize ){
		return personService.getAllPerson(pageIndex, pageSize);
	}
	
	@RequestMapping(value="/persons/createPerson", method = RequestMethod.POST)
	public @ResponseBody void addPerson(@RequestBody PersonDTO person) {
		personService.addPerson(person);
	}
	
	@RequestMapping(value="/persons/deletePerson", method = RequestMethod.POST)
	public @ResponseBody void deletePerson(@RequestBody long personId) {
		personService.deletePerson(personId);
	}
	
	@RequestMapping(value="/persons", method = RequestMethod.PUT)
	public @ResponseBody void editPerson(PersonDTO person) {
		personService.editPerson(person);
	}
}
