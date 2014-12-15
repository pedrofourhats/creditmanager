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
}
