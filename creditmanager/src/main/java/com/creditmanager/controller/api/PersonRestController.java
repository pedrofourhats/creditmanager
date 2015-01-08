package com.creditmanager.controller.api;

import java.util.List;

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
	public @ResponseBody Page<PersonDTO> getAll(@PathVariable int pageIndex, @PathVariable int pageSize){
		return personService.getAllPerson(pageIndex, pageSize, null);
	}
	
	@RequestMapping(value="/persons/{pageIndex}/{pageSize}/{searchedKeyword}", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<PersonDTO> getFiltered(@PathVariable int pageIndex, @PathVariable int pageSize, @PathVariable String searchedKeyword){
		return personService.getAllPerson(pageIndex, pageSize, searchedKeyword);
	}
	
	@RequestMapping(value="/persons/createPerson", method = RequestMethod.POST)
	public @ResponseBody void addPerson(@RequestBody PersonDTO person) {
		personService.addPerson(person);
	}
	
	@RequestMapping(value="/persons/deletePerson", method = RequestMethod.POST)
	public @ResponseBody void deletePerson(@RequestBody long personId) {
		personService.deletePerson(personId);
	}
	
	@RequestMapping(value="/persons/editPerson", method = RequestMethod.POST)
	public @ResponseBody void editPerson(@RequestBody PersonDTO person) {
		personService.editPerson(person);
	}
	
	@RequestMapping(value="/person/autocomplete/{searchedKeyword}", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<PersonDTO> autocomplete(@PathVariable String searchedKeyword){
		return personService.autocomplete(searchedKeyword);
	}
}
