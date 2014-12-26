package com.creditmanager.service;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Page;
import com.creditmanager.service.dto.ProjectDTO;

@Service
public interface ProjectService {
	
	ProjectDTO getById(Long id);
	Page<ProjectDTO> getAll(int pageIndex, int pageSize);
	Page<ProjectDTO> getByNumber(int pageIndex, int pageSize, Long number);
	void addProject(ProjectDTO project);
	void editProject(ProjectDTO project);
}
