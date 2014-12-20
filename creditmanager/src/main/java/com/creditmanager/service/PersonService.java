package com.creditmanager.service;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Page;
import com.creditmanager.model.Person;
import com.creditmanager.service.dto.PersonDTO;

@Service
public interface PersonService {
	
	Person getById(Long id);
	
	Page<PersonDTO> getAllPerson(int pageIndex, int pageSize);
	
	void addPerson(PersonDTO person);
	
	void editPerson(PersonDTO person);
	
	void deletePerson(long personId);
}
