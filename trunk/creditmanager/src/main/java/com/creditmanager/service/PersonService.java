package com.creditmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Page;
import com.creditmanager.service.dto.PersonDTO;

@Service
public interface PersonService {
	
	PersonDTO getById(Long id);
	
	Page<PersonDTO> getAllPerson(int pageIndex, int pageSize, String searchedKeyword);
	
	List<PersonDTO> autocomplete(String searchedKeyword);
	
	void addPerson(PersonDTO person);
	
	void editPerson(PersonDTO person);
	
	void deletePerson(long personId);
}
