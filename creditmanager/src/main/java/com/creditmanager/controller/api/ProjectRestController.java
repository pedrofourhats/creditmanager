package com.creditmanager.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.ProjectDTO;

@RestController
public class ProjectRestController {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping(value="/projects", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<ProjectDTO> getAll(){
		return projectService.getAll();
	}
}