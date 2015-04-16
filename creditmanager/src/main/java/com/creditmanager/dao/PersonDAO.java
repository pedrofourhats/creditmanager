package com.creditmanager.dao;

import java.util.List;

import com.creditmanager.model.Page;
import com.creditmanager.model.Person;

public interface PersonDAO extends GenericDAO<Person, Long> {
	Page<Person> getAllPerson(int pageIndex, int pageSize);
	List<Person> findByName(String name);
	Page<Person> getFilteredPerson(int pageIndex, int pageSize, String searchedKeyword);
	List<Person> getByIds(List<Long> ids);
	boolean existUserWithEmail(String email);
	boolean existUserWithDni(String identityNumber);
	boolean existPersonWithName(String name, String surname);
	boolean existPersonWithAddress(String address, String addressNumber, String addressFloor, String addressAppartment, String locality, String province);
}