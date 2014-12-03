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
}
