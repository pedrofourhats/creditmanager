package com.creditmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Person;

@Service
public interface PersonService {
	
	Person getById(Long id);
	
	List<Person> getAll();
}
