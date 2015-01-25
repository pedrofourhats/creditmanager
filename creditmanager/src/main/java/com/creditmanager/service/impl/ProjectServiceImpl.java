package com.creditmanager.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanToPropertyValueTransformer;
import org.apache.commons.collections.CollectionUtils;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.FormDAO;
import com.creditmanager.dao.PersonDAO;
import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.Form;
import com.creditmanager.model.Page;
import com.creditmanager.model.Person;
import com.creditmanager.model.Project;
import com.creditmanager.model.exceptions.ProjectHasHoldersOrGuarantorsException;
import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.FormDTO;
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
	
	@Autowired
	private FormDAO formDao; 

	@Override
	public Page<ProjectDTO> getAll(int pageIndex, int pageSize) {
		Page<Project> projects = projectDao.getAllProjects(pageIndex, pageSize);
		return MapperUtil.map(mapper, projects, ProjectDTO.class);
	}

	@Override
	public ProjectDTO getById(Long id) {
		Project project = projectDao.getById(id);
		return mapper.map(project, ProjectDTO.class);
	}

	@Override
	public ProjectDTO addProject(ProjectDTO projectDto) {
		List<Long> guarantorIds = getPersonIds(projectDto.getGuarantors());
		List<Long> holderIds = getPersonIds(projectDto.getHolders());
		
		Set<Person> guarantors = new HashSet<Person>(personDao.getByIds(guarantorIds));
		Set<Person> holders = new HashSet<Person>(personDao.getByIds(holderIds));
		Project project = new Project(projectDto.getDateOfEntry(), projectDto.getNumber(), projectDto.getServicers(), projectDto.getSituationState(), 
			projectDto.getEvaluator(), projectDto.getAccesor(), guarantors, holders, projectDto.getInvestmentDestination());
		projectDao.add(project);
		
		return mapper.map(project, ProjectDTO.class);
	}

	@Override
	public void editProject(ProjectDTO project) {
		List<Long> guarantorIds = getPersonIds(project.getGuarantors());
		List<Long> holderIds = getPersonIds(project.getHolders());
		
		Set<Person> guarantors = new HashSet<Person>(personDao.getByIds(guarantorIds));
		Set<Person> holders = new HashSet<Person>(personDao.getByIds(holderIds));
		
		Project projectToEdit = projectDao.getById(project.getId());
		projectToEdit.update(project.getDateOfEntry(), project.getNumber(), project.getServicers(), project.getSituationState(), guarantors, holders, 
			project.getInvestmentDestination(), project.getTitle(), project.getType(), project.getEconomicArea(), project.getEconomicActivity(), project.getCategory(), 
			project.getRequestedAmount(), project.getRequestedDeadline(), project.getRequestedGracePeriod(), project.getDeliveryDate(), 
			project.getGivenAmount(), project.getGivenDeadline());
		projectDao.add(projectToEdit);
	}
	
	@Override
	public void saveProjectForm(FormDTO formDto, Long projectId) {
		Project project = projectDao.getById(projectId);
		Form form = new Form();
		if(formDto.getId() != null) {
			form = formDao.getById(formDto.getId());
		}
		
		form.setCheckNumber(formDto.getCheckNumber());
		form.setDate(formDto.getDate());
		form.setDay(formDto.getDay());
		form.setMonth(formDto.getMonth());
		form.setName(formDto.getName());
		form.setProject(project);
		form.setYear(formDto.getYear());

		formDao.add(form);
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

	@Override
	public void deleteProject(Long projectId) throws ProjectHasHoldersOrGuarantorsException {
		Project project = projectDao.getById(projectId);
		if(project.getGuarantors().size() > 0 || project.getHolders().size() > 0){
			throw new ProjectHasHoldersOrGuarantorsException();
		}
		projectDao.delete(project);
	}

	@Override
	public List<ProjectDTO> getGuarantorProjectsByUser(long personId) {
		//TODO: HACERLO BIEN EN ALGUN MOMENTO
		List<Project> projects = new ArrayList<Project>();
		projects.addAll(this.personDao.getById(personId).getGuarantorProjects());
		return MapperUtil.map(mapper, projects, ProjectDTO.class);
	}
	
	@Override
	public List<ProjectDTO> getHolderProjectsByUser(long personId) {
		//TODO: HACERLO BIEN EN ALGUN MOMENTO
		List<Project> projects = new ArrayList<Project>();
		projects.addAll(this.personDao.getById(personId).getHolderProjects());
		return MapperUtil.map(mapper, projects, ProjectDTO.class);
	}
}
