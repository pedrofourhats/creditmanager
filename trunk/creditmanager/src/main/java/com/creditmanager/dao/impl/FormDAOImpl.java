package com.creditmanager.dao.impl;

import org.springframework.stereotype.Repository;

import com.creditmanager.dao.FormDAO;
import com.creditmanager.model.Form;

@Repository
public class FormDAOImpl  extends GenericDAOImpl<Form, Long> implements FormDAO {

	protected FormDAOImpl() {
		super(Form.class.getName());
	}
}