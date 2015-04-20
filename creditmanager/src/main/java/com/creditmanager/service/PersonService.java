package com.creditmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Page;
import com.creditmanager.model.exceptions.PersonHasProjectsException;
import com.creditmanager.service.dto.PersonDTO;

@Service
public interface PersonService {
	
	PersonDTO getById(Long id);
	Page<PersonDTO> getAllPerson(int pageIndex, int pageSize, String searchedKeyword);
	List<PersonDTO> autocomplete(String searchedKeyword);
	List<PersonDTO> getPersonByType(String type);
	void addPerson(PersonDTO person);
	void editPerson(PersonDTO person);
	void deletePerson(long personId) throws PersonHasProjectsException;
	boolean existUserWithEmail(String email);
	boolean existUserWithDni(String identityNumber);
	boolean existPersonWithName(String name, String surname);
	boolean existPersonWithAddress(String address, String addressNumber, String addressFloor, String addressAppartment, String locality, String province);
}