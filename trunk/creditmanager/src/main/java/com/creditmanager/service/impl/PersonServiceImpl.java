package com.creditmanager.service.impl;

import java.util.List;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.model.Person;
import com.creditmanager.service.PersonService;
import com.creditmanager.service.dto.PersonDTO;
import com.creditmanager.service.util.MapperUtil;

public class PersonServiceImpl implements PersonService {

	@Autowired
	private Mapper mapper;
	
	@Autowired
	private PersonDAO personDAO;

	@Override
	public Person getById(Long id) {
		return personDAO.getById(id);
	}

	@Override
	public List<PersonDTO> getAll() {
		return MapperUtil.map(mapper, personDAO.getAll(), PersonDTO.class);
	}

	@Override
	public void addPerson(PersonDTO person) {
		Person newPerson = new Person(person.getName(), person.getSurname(), person.getIdentityType(), person.getIdentityNumber(), person.getBirthDate(), person.getGender(), person.getPhone(), person.getWorkPhone(),
				person.getCellPhone(), person.getEmail(), person.getProvince(), person.getLocality(), person.getAddress(), person.getPostCode());
		personDAO.add(newPerson);
	}

	@Override
	public void editPerson(PersonDTO person) {
		// TODO Auto-generated method stub
		
	}
}
