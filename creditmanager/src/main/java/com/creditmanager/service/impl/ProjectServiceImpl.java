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

import com.creditmanager.dao.AdditionalFormDAO;
import com.creditmanager.dao.ContactDAO;
import com.creditmanager.dao.FormDAO;
import com.creditmanager.dao.PersonDAO;
import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.AdditionalForm;
import com.creditmanager.model.Contact;
import com.creditmanager.model.Form;
import com.creditmanager.model.Page;
import com.creditmanager.model.Person;
import com.creditmanager.model.Project;
import com.creditmanager.model.exceptions.ProjectHasHoldersOrGuarantorsException;
import com.creditmanager.service.ProjectService;
import com.creditmanager.service.dto.AdditionalFormDTO;
import com.creditmanager.service.dto.ContactDTO;
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
	
	@Autowired
	private ContactDAO contactDao;
	
	@Autowired
	private AdditionalFormDAO additionalFormDao;

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
		Set<Person> guarantors = new HashSet<Person>();
		Set<Person> holders = new HashSet<Person>();
		
		if(guarantorIds.size() > 0) {
			guarantors = new HashSet<Person>(personDao.getByIds(guarantorIds));
		}
		
		if(holderIds.size() > 0) {
			holders = new HashSet<Person>(personDao.getByIds(holderIds));
		}
		
		Person evaluator = personDao.getById(projectDto.getEvaluator().getId());
		Person accesor = personDao.getById(projectDto.getAccesor().getId());
		
		Project project = new Project(projectDto.getDateOfEntry(), projectDto.getNumber(), projectDto.getServicers(), projectDto.getSituationState(), 
			evaluator, accesor, guarantors, holders, projectDto.getInvestmentDestination(), projectDto.getTitle(), projectDto.getType(),
			projectDto.getEconomicArea(), projectDto.getEconomicActivity(), projectDto.getCategory(), projectDto.getRequestedAmount(), projectDto.getRequestedDeadline(),
			projectDto.getRequestedGracePeriod(), projectDto.getGivenGracePeriod(), projectDto.getDeliveryDate(), projectDto.getGivenAmount(), projectDto.getGivenDeadline(),
			projectDto.getOriginalRate(), projectDto.getEffectiveRate());
		projectDao.add(project);
		
		return mapper.map(project, ProjectDTO.class);
	}

	@Override
	public void editProject(ProjectDTO project) {
		List<Long> guarantorIds = getPersonIds(project.getGuarantors());
		List<Long> holderIds = getPersonIds(project.getHolders());
		Set<Person> guarantors = new HashSet<Person>();
		Set<Person> holders = new HashSet<Person>();
		
		if(guarantorIds.size() > 0) {
			guarantors = new HashSet<Person>(personDao.getByIds(guarantorIds));
		}
		
		if(holderIds.size() > 0) {
			holders = new HashSet<Person>(personDao.getByIds(holderIds));
		}
		
		Person evaluator = personDao.getById(project.getEvaluator().getId());
		Person accesor = personDao.getById(project.getAccesor().getId());
		
		Project projectToEdit = projectDao.getById(project.getId());
		projectToEdit.update(project.getDateOfEntry(), project.getNumber(), project.getServicers(), project.getSituationState(), guarantors, holders, 
			project.getInvestmentDestination(), project.getTitle(), project.getType(), project.getEconomicArea(), project.getEconomicActivity(), 
			project.getCategory(), project.getRequestedAmount(), project.getRequestedDeadline(), project.getRequestedGracePeriod(), project.getGivenGracePeriod(),
			project.getDeliveryDate(), project.getGivenAmount(), project.getGivenDeadline(), project.getDefaultForms(), project.getOriginalRate(), 
			project.getEffectiveRate(), evaluator, accesor);
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
	public ContactDTO saveProjectContact(ContactDTO contactDto, Long projectId) {
		Project project = projectDao.getById(projectId);
		Contact contact = new Contact();
		if(contactDto.getId() != null){
			contact = contactDao.getById(contactDto.getId());
		}
		
		contact.upadte(contactDto.getDate(), contactDto.getComment(), contactDto.getUserId(), project);
		contactDao.add(contact);
		return mapper.map(contact, ContactDTO.class);
	}

	@Override
	public void saveProjectAdditionalForm(AdditionalFormDTO formDto) {
		Project project = projectDao.getById(formDto.getProjectId());
		AdditionalForm form = new AdditionalForm(formDto.getFileName(), project);
		additionalFormDao.add(form);
	}
	
	@Override
	public Page<ProjectDTO> getByNumber(int pageIndex, int pageSize, String number) {
		Page<Project> projects = projectDao.findByProjectNumber(pageIndex, pageSize, number);
		return MapperUtil.map(mapper, projects, ProjectDTO.class);
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
	

	@Override
	public Page<AdditionalFormDTO> getAdditionalForms(int pageIndex, int pageSize) {
		Page<AdditionalForm> forms = additionalFormDao.getFormsPage(pageIndex, pageSize);
		return MapperUtil.map(mapper, forms, AdditionalFormDTO.class);
	}
}
