package com.creditmanager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.service.ProjectService;

public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDao;
}
