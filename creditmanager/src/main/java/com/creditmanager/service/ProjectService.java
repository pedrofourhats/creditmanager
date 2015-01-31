package com.creditmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Page;
import com.creditmanager.model.exceptions.ProjectHasHoldersOrGuarantorsException;
import com.creditmanager.service.dto.FormDTO;
import com.creditmanager.service.dto.ProjectDTO;

@Service
public interface ProjectService {
	
	ProjectDTO getById(Long id);
	Page<ProjectDTO> getAll(int pageIndex, int pageSize);
	Page<ProjectDTO> getByNumber(int pageIndex, int pageSize, String number);
	ProjectDTO addProject(ProjectDTO project);
	void editProject(ProjectDTO project);
	void deleteProject(Long projectId) throws ProjectHasHoldersOrGuarantorsException;
	List<ProjectDTO> getGuarantorProjectsByUser(long personId);
	List<ProjectDTO> getHolderProjectsByUser(long personId);
	void saveProjectForm(FormDTO form, Long projectId);
}
