package com.creditmanager.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.creditmanager.security.CustomUser;

public class GenericController {
	
	public boolean isUserLogged(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth instanceof AnonymousAuthenticationToken){
			return false;
		}
		
		return true;
	}
	
	public long getUserId(){
		if(isUserLogged()){
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return user.getId();
		} else {
			return 0;
		}
	}
}
