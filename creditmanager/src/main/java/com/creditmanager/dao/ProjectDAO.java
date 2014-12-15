package com.creditmanager.dao;

import com.creditmanager.model.Page;
import com.creditmanager.model.Project;

public interface ProjectDAO extends GenericDAO<Project, Long> {
	Page<Project> getAllProjects(int pageIndex, int pageSize);
}
