package com.creditmanager.service.impl;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.Page;
import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.ProjectDTO;
import com.creditmanager.service.util.MapperUtil;

@Transactional
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private Mapper mapper;
	
	@Autowired
	private ProjectDAO projectDao;

	@Override
	public Page<ProjectDTO> getAll(int pageIndex, int pageSize) {
		return MapperUtil.map(mapper, projectDao.getAllProjects(pageIndex, pageSize), ProjectDTO.class);
	}

	@Override
	public ProjectDTO getById(Long id) {
		return mapper.map(getById(id), ProjectDTO.class);
	}

	@Override
	public void addProject(ProjectDTO project) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editProject(ProjectDTO project) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Page<ProjectDTO> getByNumber(int pageIndex, int pageSize, Long number) {
		return MapperUtil.map(mapper, projectDao.findByProjectNumber(pageIndex, pageSize, number), ProjectDTO.class);
	}
}
