package com.creditmanager.dao.impl;

import org.springframework.stereotype.Repository;

import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.Project;

@Repository
public class ProjectDAOImpl extends GenericDAOImpl<Project, Long> implements ProjectDAO {

	protected ProjectDAOImpl() {
		super(Project.class.getName());
	}

}
