package com.creditmanager.dao.impl;

import org.springframework.stereotype.Repository;

import com.creditmanager.dao.ContactDAO;
import com.creditmanager.model.Contact;

@Repository
public class ContactDAOImpl extends GenericDAOImpl<Contact, Long> implements ContactDAO{

	protected ContactDAOImpl() {
		super(Contact.class.getName());
	}
}
