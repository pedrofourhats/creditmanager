package com.creditmanager.dao;

import java.util.List;

import com.creditmanager.model.Person;

public interface PersonDAO extends GenericDAO<Person, Long> {
	List<Person> findByName(String name);
}