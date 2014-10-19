package com.creditmanager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.creditmanager.model.User;
import com.creditmanager.security.CustomUser;
import com.creditmanager.security.UserGrantedAuthority;
import com.creditmanager.service.UserService;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		
		if (username != null && !username.equals("")) {
			User user = userService.getByUsername(username);
			if(user == null) {
				throw new UsernameNotFoundException("UserNameNotFound");
			}
			
			GrantedAuthority grantedAuth = new UserGrantedAuthority(user.getRole().getRole());
			return new CustomUser(user.getId(), user.getUsername(), user.getPassword(), user.isEnable(), 
					user.getName(), user.getSurname(), new GrantedAuthority[]{ grantedAuth });
        } else {
        	throw new UsernameNotFoundException("UserNameNotFound");
        }
	}

}
