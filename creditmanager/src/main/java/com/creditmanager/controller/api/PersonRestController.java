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
	
	@RequestMapping(value="/persons/{pageIndex}/{pageSize}/{personCategory}", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<PersonDTO> getAll(@PathVariable int pageIndex, @PathVariable int pageSize, @PathVariable String personCategory) {
		if(personCategory.equals("ALL")) {
			return personService.getAllPerson(pageIndex, pageSize, null);	
		} else {
			return personService.getPersonByType(pageIndex, pageSize, personCategory, null);
		}
	}
	
	@RequestMapping(value="/persons/{pageIndex}/{pageSize}/{personCategory}/{searchedKeyword}", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<PersonDTO> getFiltered(@PathVariable int pageIndex, @PathVariable int pageSize, @PathVariable String personCategory, @PathVariable String searchedKeyword) {
		if(personCategory.equals("ALL")) {
			return personService.getAllPerson(pageIndex, pageSize, searchedKeyword);	
		} else {
			return personService.getPersonByType(pageIndex, pageSize, personCategory, searchedKeyword);
		}
	}
	
	@RequestMapping(value="/persons/createPerson", method = RequestMethod.POST)
	public @ResponseBody CreditManagerError addPerson(@RequestBody PersonDTO person) {
		if(person.getAddress() != null)  person.setAddress(person.getAddress().toUpperCase());
		if(person.getAddressAppartment() != null) person.setAddressAppartment(person.getAddressAppartment().toUpperCase());
		if(person.getAddressFloor() != null) person.setAddressFloor(person.getAddressFloor().toUpperCase());
		if(person.getAddressNumber() != null) person.setAddressNumber(person.getAddressNumber().toUpperCase());
		if(person.getProvince() != null) person.setProvince(person.getProvince().toUpperCase());
		if(person.getLocality() != null) person.setLocality(person.getLocality().toUpperCase());
		
		String identityNumber = person.getIdentityNumber();
		if(identityNumber != null) {
			char c = Character.toLowerCase(identityNumber.charAt(0));
			if(c >= 'a' && c <= 'z') {
				identityNumber = identityNumber.substring(1);
			}
		}
		
		if(this.personService.existUserWithDni(identityNumber)) {
			return new CreditManagerError("Existe un usuario con el dni " + identityNumber, "Error");
		}
		
		String warnings = "";
		
		if(this.personService.existUserWithEmail(person.getEmail())) {
			warnings += "Existe un usuario con el email " + person.getEmail() + ". ";
		}
		
		if(this.personService.existPersonWithName(person.getName(), person.getSurname())) {
			warnings += "Existe un usuario con el nombre " + person.getName() + " " + person.getSurname() + ". ";
		}
		
		if(this.personService.existPersonWithAddress(person.getAddress(), person.getAddressNumber(), person.getAddressFloor(), person.getAddressAppartment(), person.getLocality(), person.getProvince())) {
			warnings += "Existe un usuario con la direcci�n ";
			warnings += person.getAddress() != null ? person.getAddress() : "";
			warnings += person.getAddressNumber() != null ? (", " + person.getAddressNumber()) : ""; 
			warnings += person.getAddressFloor() != null ? (", " + person.getAddressFloor()) : "";
			warnings += person.getAddressAppartment() != null ? (", " + person.getAddressAppartment()) : "";
			warnings += person.getLocality() != null ? (", " + person.getLocality()) : "";
			warnings += person.getProvince() != null ? (", " + person.getProvince()) : "";
			warnings += ". ";
		}
		
		if(warnings != "") {
			warnings += "�Desea continuar?";
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
		if(person.getAddress() != null)  person.setAddress(person.getAddress().toUpperCase());
		if(person.getAddressAppartment() != null) person.setAddressAppartment(person.getAddressAppartment().toUpperCase());
		if(person.getAddressFloor() != null) person.setAddressFloor(person.getAddressFloor().toUpperCase());
		if(person.getAddressNumber() != null) person.setAddressNumber(person.getAddressNumber().toUpperCase());
		if(person.getProvince() != null) person.setProvince(person.getProvince().toUpperCase());
		if(person.getLocality() != null) person.setLocality(person.getLocality().toUpperCase());
		
		String identityNumber = person.getIdentityNumber();
		if(identityNumber != null) {
			char c = Character.toLowerCase(identityNumber.charAt(0));
			if(c >= 'a' && c <= 'z') {
				identityNumber = identityNumber.substring(1);
			}
		}
		
		if(this.personService.existUserWithDni(identityNumber)) {
			if(!person.getIdentityNumber().equals(this.personService.getById(person.getId()).getIdentityNumber())) {
				return new CreditManagerError("Existe un usuario con el dni " + identityNumber, "Error");
			}
		}

		String warnings = "";
		PersonDTO existingPerson = this.personService.getById(person.getId());
		
		if(this.personService.existUserWithEmail(person.getEmail())) {
			if(!person.getEmail().equals(existingPerson.getEmail())) {
				warnings += "Existe un usuario con el email " + person.getEmail() + ". ";
			}
		}
		
		if(this.personService.existPersonWithName(person.getName(), person.getSurname())) {
			if(!(existingPerson.getName() + existingPerson.getSurname()).equals(person.getName() + person.getSurname())) {
				warnings += "Existe un usuario con el nombre " + person.getName() + " " + person.getSurname() + ". ";
			}
		}
		
		if(this.personService.existPersonWithAddress(person.getAddress(), person.getAddressNumber(), person.getAddressFloor(), person.getAddressAppartment(), person.getLocality(), person.getProvince())) {
			if(!(existingPerson.getAddress() + existingPerson.getAddressNumber() + existingPerson.getAddressFloor() + existingPerson.getAddressAppartment() + existingPerson.getLocality() + existingPerson.getProvince()).equals(person.getAddress() + person.getAddressNumber() + person.getAddressFloor() + person.getAddressAppartment() + person.getLocality() + person.getProvince())) {
				warnings += "Existe un usuario con la direcci�n ";
				warnings += person.getAddress() != null ? person.getAddress() : "";
				warnings += person.getAddressNumber() != null ? (", " + person.getAddressNumber()) : ""; 
				warnings += person.getAddressFloor() != null ? (", " + person.getAddressFloor()) : "";
				warnings += person.getAddressAppartment() != null ? (", " + person.getAddressAppartment()) : "";
				warnings += person.getLocality() != null ? (", " + person.getLocality()) : "";
				warnings += person.getProvince() != null ? (", " + person.getProvince()) : "";
				warnings += ". ";
			}
		}
		
		if(warnings != "") {
			warnings += "�Desea continuar?";
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
	
	@RequestMapping(value="/person/intiEvaluators", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<PersonDTO> getIntiEvaluators(){
		return personService.getPersonByType("EVALUADORES INTI");
	}

	@RequestMapping(value="/person/intiAccesor", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<PersonDTO> getIntiAccesor(){
		return personService.getPersonByType("ASESORES CAFESG");
	}
}
