package com.creditmanager.service;

import org.springframework.stereotype.Service;

import com.creditmanager.model.Page;
import com.creditmanager.service.dto.ProjectDTO;

@Service
public interface ProjectService {
	Page<ProjectDTO> getAll(int pageIndex, int pageSize);
}
