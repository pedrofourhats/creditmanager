package com.creditmanager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.model.Person;
import com.creditmanager.service.PersonService;

public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonDAO personDAO;

	@Override
	public Person getById(Long id) {
		return personDAO.getById(id);
	}

	@Override
	public List<Person> getAll() {
		return personDAO.getAll();
	}
}
