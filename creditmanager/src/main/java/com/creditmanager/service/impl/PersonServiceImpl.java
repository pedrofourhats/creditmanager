package com.creditmanager.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.model.Page;
import com.creditmanager.model.Person;
import com.creditmanager.model.exceptions.PersonHasProjectsException;
import com.creditmanager.service.PersonService;
import com.creditmanager.service.dto.PersonDTO;
import com.creditmanager.service.util.MapperUtil;

@Transactional
public class PersonServiceImpl implements PersonService {

	@Autowired
	private Mapper mapper;
	
	@Autowired
	private PersonDAO personDAO;

	public PersonDTO getById(Long id) {
		return MapperUtil.map(mapper, personDAO.getById(id), PersonDTO.class);
	}

	public Page<PersonDTO> getAllPerson(int pageIndex, int pageSize, String searchedKeyword) {
		Page<Person> personList;
		
		if(searchedKeyword != null) {
			personList = personDAO.getFilteredPerson(pageIndex, pageSize, searchedKeyword);
		} else {
			personList = personDAO.getAllPerson(pageIndex, pageSize);		
		}
		
		return MapperUtil.map(mapper, personList, PersonDTO.class);
	}

	public void addPerson(PersonDTO person) {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date d = formatter.parse("1001-01-01");
			if(person.getBirthDate().compareTo(d) < 0) {
				person.setBirthDate(null);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Person newPerson = new Person(person.getName(), person.getSurname(), person.getIdentityType(), person.getIdentityNumber(), person.getBirthDate(), person.getGender(), person.getPhone(), person.getWorkPhone(),
				person.getCellPhone(), person.getEmail(), person.getProvince(), person.getLocality(), person.getAddress(), person.getAddressNumber(), person.getAddressFloor(), person.getAddressAppartment(), person.getPostCode(), person.getType());
		personDAO.add(newPerson);
	}

	public void editPerson(PersonDTO person) {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date d = formatter.parse("1001-01-01");
			if(person.getBirthDate().compareTo(d) < 0) {
				person.setBirthDate(null);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Person personToEdit = personDAO.getById(person.getId());
		personToEdit.setAddress(person.getAddress());
		personToEdit.setAddressAppartment(person.getAddressAppartment());
		personToEdit.setAddressNumber(person.getAddressNumber());
		personToEdit.setAddressFloor(person.getAddressFloor());
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
		personToEdit.setType(person.getType());
		personDAO.add(personToEdit);
	}

	public void deletePerson(long personId) throws PersonHasProjectsException {
		Person person = this.personDAO.getById(personId);
		if(person.getGuarantorProjects().size() > 0 || person.getHolderProjects().size() > 0){
			throw new PersonHasProjectsException();
		}
		
		this.personDAO.delete(person);
	}

	public List<PersonDTO> autocomplete(String searchedKeyword) {
		return MapperUtil.map(mapper, personDAO.findByName(searchedKeyword), PersonDTO.class);
	}

	public boolean existUserWithEmail(String email) {
		return this.personDAO.existUserWithEmail(email);
	}

	public boolean existUserWithDni(String identityNumber) {
		return this.personDAO.existUserWithDni(identityNumber);
	}

	public boolean existPersonWithName(String name, String surname) {
		return this.personDAO.existPersonWithName(name, surname);
	}

	public boolean existPersonWithAddress(String address, String addressNumber, String addressFloor, String addressAppartment, String locality, String province) {
		return this.personDAO.existPersonWithAddress(address, addressNumber, addressFloor, addressAppartment, locality, province);
	}

	@Override
	public List<PersonDTO> getPersonByType(String type) {
		List<Person> persons = personDAO.getByType(type);
		return MapperUtil.map(mapper, persons, PersonDTO.class);
	}
}
