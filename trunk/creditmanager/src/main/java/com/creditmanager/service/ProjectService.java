package com.creditmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.service.dto.ProjectDTO;

@Service
public interface ProjectService {
	List<ProjectDTO> getAll();
}
