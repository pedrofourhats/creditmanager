package com.creditmanager.service;

import org.springframework.stereotype.Service;

import com.creditmanager.model.User;

@Service
public interface UserService {

	public User getByUsername(String username);
	
}
