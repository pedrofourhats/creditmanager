package com.creditmanager.dao.impl;

import org.springframework.stereotype.Repository;

import com.creditmanager.model.Project;

@Repository
public class ProjectDAOImpl extends GenericDAOImpl<Project, Long> {

	protected ProjectDAOImpl() {
		super(Project.class.getName());
	}

}
