package com.creditmanager.service.impl;

import java.util.List;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.ProjectDTO;
import com.creditmanager.service.util.MapperUtil;

public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private Mapper mapper;
	
	@Autowired
	private ProjectDAO projectDao;

	@Override
	public List<ProjectDTO> getAll() {
		return MapperUtil.map(mapper, projectDao.getAll(), ProjectDTO.class);
	}
}
