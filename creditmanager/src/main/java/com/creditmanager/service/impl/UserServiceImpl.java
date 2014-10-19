package com.creditmanager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.creditmanager.dao.UserDAO;
import com.creditmanager.model.User;
import com.creditmanager.service.UserService;

public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public User getByUsername(String username) {
		return userDAO.getByUsername(username);
	}

}
