package com.creditmanager.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.apache.commons.beanutils.BeanToPropertyValueTransformer;
import org.apache.commons.collections.CollectionUtils;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.Page;
import com.creditmanager.model.Person;
import com.creditmanager.model.Project;
import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.PersonDTO;
import com.creditmanager.service.dto.ProjectDTO;
import com.creditmanager.service.util.MapperUtil;

@Transactional
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private Mapper mapper;
	
	@Autowired
	private ProjectDAO projectDao;
	
	@Autowired
	private PersonDAO personDao; 

	@Override
	public Page<ProjectDTO> getAll(int pageIndex, int pageSize) {
		Page<Project> projects = projectDao.getAllProjects(pageIndex, pageSize);
		return MapperUtil.map(mapper, projects, ProjectDTO.class);
	}

	@Override
	public ProjectDTO getById(Long id) {
		return mapper.map(getById(id), ProjectDTO.class);
	}

	@Override
	public void addProject(ProjectDTO projectDto) {
		List<Long> guarantorIds = getPersonIds(projectDto.getGuarantors());
		List<Long> holderIds = getPersonIds(projectDto.getHolders());
		
		Set<Person> guarantors = new HashSet<Person>(personDao.getByIds(guarantorIds));
		Set<Person> holders = new HashSet<Person>(personDao.getByIds(holderIds));
		Project project = new Project(projectDto.getDateOfEntry(), projectDto.getNumber(), projectDto.getServicers(), projectDto.getSituationState(), 
			guarantors, holders, projectDto.getInvestmentDestination());
		projectDao.add(project);
	}

	@Override
	public void editProject(ProjectDTO project) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Page<ProjectDTO> getByNumber(int pageIndex, int pageSize, Long number) {
		return MapperUtil.map(mapper, projectDao.findByProjectNumber(pageIndex, pageSize, number), ProjectDTO.class);
	}
	
	@SuppressWarnings("unchecked")
	private List<Long> getPersonIds(List<PersonDTO> guarantors) {
		List<Long> idList = (List<Long>) CollectionUtils.collect(guarantors, new BeanToPropertyValueTransformer("id"));
		return idList;
	}
}
