package com.creditmanager.service.impl;

import java.util.List;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.model.Page;
import com.creditmanager.model.Person;
import com.creditmanager.service.PersonService;
import com.creditmanager.service.dto.PersonDTO;
import com.creditmanager.service.util.MapperUtil;

@Transactional
public class PersonServiceImpl implements PersonService {

	@Autowired
	private Mapper mapper;
	
	@Autowired
	private PersonDAO personDAO;

	@Override
	public PersonDTO getById(Long id) {
		return MapperUtil.map(mapper, personDAO.getById(id), PersonDTO.class);
	}

	@Override
	public Page<PersonDTO> getAllPerson(int pageIndex, int pageSize, String searchedKeyword) {
		Page<Person> personList;
		
		if(searchedKeyword != null) {
			personList = personDAO.getFilteredPerson(pageIndex, pageSize, searchedKeyword);
		} else {
			personList = personDAO.getAllPerson(pageIndex, pageSize);		
		}
		
		return MapperUtil.map(mapper, personList, PersonDTO.class);
	}

	@Override
	public void addPerson(PersonDTO person) {
		Person newPerson = new Person(person.getName(), person.getSurname(), person.getIdentityType(), person.getIdentityNumber(), person.getBirthDate(), person.getGender(), person.getPhone(), person.getWorkPhone(),
				person.getCellPhone(), person.getEmail(), person.getProvince(), person.getLocality(), person.getAddress(), person.getPostCode());
		personDAO.add(newPerson);
	}

	@Override
	public void editPerson(PersonDTO person) {
		Person personToEdit = personDAO.getById(person.getId());
		personToEdit.setAddress(person.getAddress());
		personToEdit.setBirthDate(person.getBirthDate());
		personToEdit.setCellPhone(person.getCellPhone());
		personToEdit.setEmail(person.getEmail());
		personToEdit.setGender(person.getGender());
		personToEdit.setIdentityNumber(person.getIdentityNumber());
		personToEdit.setIdentityType(person.getIdentityType());
		personToEdit.setLocality(person.getLocality());
		personToEdit.setName(person.getName());
		personToEdit.setPhone(person.getPhone());
		personToEdit.setPostCode(person.getPostCode());
		personToEdit.setProvince(person.getProvince());
		personToEdit.setSurname(person.getSurname());
		personToEdit.setWorkPhone(person.getWorkPhone());
		personDAO.add(personToEdit);
	}

	@Override
	public void deletePerson(long personId) {
		Person person = this.personDAO.getById(personId);
		this.personDAO.delete(person);
	}

	@Override
	public List<PersonDTO> autocomplete(String searchedKeyword) {
		return MapperUtil.map(mapper, personDAO.findByName(searchedKeyword), PersonDTO.class);
	}
}
