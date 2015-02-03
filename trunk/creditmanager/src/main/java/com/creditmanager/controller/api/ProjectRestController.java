package com.creditmanager.controller.api;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.model.Page;
import com.creditmanager.model.exceptions.ProjectHasHoldersOrGuarantorsException;
import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.ContactDTO;
import com.creditmanager.service.dto.FormDTO;
import com.creditmanager.service.dto.ProjectDTO;

@RestController
public class ProjectRestController {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping(value="/projects", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<ProjectDTO> getProjects(int pageIndex, int pageSize){
		return projectService.getAll(pageIndex, pageSize);
	}
	
	@RequestMapping(value="/projects/{projectNumber}", method = RequestMethod.GET, consumes="*/*")
	public @ResponseBody Page<ProjectDTO> getProjects(@PathVariable String projectNumber, int pageIndex, int pageSize){
		return projectService.getByNumber(pageIndex, pageSize, projectNumber);
	}
	
	@RequestMapping(value="/projects", method=RequestMethod.POST)
	public @ResponseBody ProjectDTO addProject(@RequestBody ProjectDTO project){
		return projectService.addProject(project);
	}
	
	@RequestMapping(value="/projects/{id}",method=RequestMethod.PUT)
	public @ResponseBody void editProject(@RequestBody ProjectDTO project, @PathVariable Long id) {
		project.setId(id);
		projectService.editProject(project);
	}
	
	@RequestMapping(value="/projects/form/{id}",method=RequestMethod.PUT)
	public @ResponseBody void saveForm(@RequestBody FormDTO form, @PathVariable Long id) {
		projectService.saveProjectForm(form, id);
	}
	
	@RequestMapping(value="/projects/contact/{id}")
	public @ResponseBody ContactDTO saveContact(@RequestBody ContactDTO contactDto, @PathVariable Long id){
		return projectService.saveProjectContact(contactDto, id);
	}
	
	@RequestMapping(value="/projects/findById/{id}", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody ProjectDTO getProjectById(@PathVariable Long id) {
		return projectService.getById(id);
	}
	
	@RequestMapping(value="/projects/{id}", method=RequestMethod.DELETE)
	public @ResponseBody void deleteProject(@PathVariable Long id) throws ProjectHasHoldersOrGuarantorsException{
		projectService.deleteProject(id);
	}
	
	@ExceptionHandler(Exception.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	public @ResponseBody Exception handleException(Exception ex, HttpServletResponse response){
		return ex;
	}
}
