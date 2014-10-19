package com.creditmanager.dao;

import com.creditmanager.model.User;

public interface UserDAO extends GenericDAO<User, Long> {

	public User getByUsername(String username);
	
}
