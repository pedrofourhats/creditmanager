package com.creditmanager.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.model.CreditManagerError;
import com.creditmanager.model.Page;
import com.creditmanager.model.exceptions.PersonHasProjectsException;
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
	public @ResponseBody CreditManagerError addPerson(@RequestBody PersonDTO person) {
		if(this.personService.existUserWithDni(person.getIdentityNumber())) {
			return new CreditManagerError("Existe un usuario con el dni " + person.getIdentityNumber(), "Error");
		}
		
		String warnings = "";
		
		if(this.personService.existUserWithEmail(person.getEmail())) {
			warnings += "Existe un usuario con el email " + person.getEmail() + ". ";
		}
		
		if(this.personService.existPersonWithName(person.getName(), person.getSurname())) {
			warnings += "Existe un usuario con el nombre " + person.getName() + " " + person.getSurname() + ". ";
		}
		
		if(this.personService.existPersonWithAddress(person.getAddress(), person.getLocality(), person.getProvince())) {
			warnings += "Existe un usuario con la dirección " + person.getAddress() + ", " + person.getLocality() + ", " + person.getProvince() + ". ";
		}
		
		if(warnings != "") {
			warnings += "¿Desea continuar?";
		} else {
			personService.addPerson(person);
		}
		
		return new CreditManagerError(warnings, "Warning");
	}
	
	@RequestMapping(value="/persons/createPersonWithoutValidation", method = RequestMethod.POST)
	public @ResponseBody void createPersonWithoutValidation(@RequestBody PersonDTO person) {
		personService.addPerson(person);
	}
	
	@RequestMapping(value="/persons/editPerson", method = RequestMethod.POST)
	public @ResponseBody CreditManagerError editPerson(@RequestBody PersonDTO person) {
		if(this.personService.existUserWithEmail(person.getEmail())) {
			if(this.personService.getById(person.getId()).getEmail() != person.getEmail()) {
				return new CreditManagerError("Existe un usuario con el email " + person.getEmail(), "Error");
			}
		}

		String warnings = "";
		PersonDTO existingPerson = this.personService.getById(person.getId());
		
		if(this.personService.existUserWithDni(person.getIdentityNumber())) {
			if(existingPerson.getIdentityNumber() != person.getIdentityNumber()) {
				warnings += "Existe un usuario con el email " + person.getEmail() + ". ";
			}
		}
		
		if(this.personService.existPersonWithName(person.getName(), person.getSurname())) {
			if(existingPerson.getName() + existingPerson.getSurname() != person.getName() + person.getSurname()) {
				warnings += "Existe un usuario con el nombre " + person.getName() + " " + person.getSurname() + ". ";
			}
		}
		
		if(this.personService.existPersonWithAddress(person.getAddress(), person.getLocality(), person.getProvince())) {
			if(existingPerson.getAddress() + existingPerson.getLocality() + existingPerson.getProvince() != person.getAddress() + person.getLocality() + person.getProvince()) {
				warnings += "Existe un usuario con la dirección " + person.getAddress() + ", " + person.getLocality() + ", " + person.getProvince() + ". ";
			}
		}
		
		if(warnings != "") {
			warnings += "¿Desea continuar?";
		} else {
			personService.editPerson(person);
		}
		
		return new CreditManagerError(warnings, "Warning");
	}
	
	@RequestMapping(value="/persons/editPersonWithoutValidation", method = RequestMethod.POST)
	public @ResponseBody void editPersonWithoutValidation(@RequestBody PersonDTO person) {
		personService.editPerson(person);
	}
	
	@RequestMapping(value="/persons/deletePerson", method = RequestMethod.POST)
	public @ResponseBody void deletePerson(@RequestBody long personId) throws PersonHasProjectsException {
		personService.deletePerson(personId);
	}
	
	@RequestMapping(value="/person/autocomplete/{searchedKeyword}", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<PersonDTO> autocomplete(@PathVariable String searchedKeyword){
		return personService.autocomplete(searchedKeyword);
	}
}
