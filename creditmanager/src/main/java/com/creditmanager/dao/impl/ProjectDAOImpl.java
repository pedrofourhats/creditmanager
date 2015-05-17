package com.creditmanager.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.Page;
import com.creditmanager.model.Project;

@Repository
public class ProjectDAOImpl extends GenericDAOImpl<Project, Long> implements ProjectDAO {

	protected ProjectDAOImpl() {
		super(Project.class.getName());
	}

	@Override
	public Page<Project> getAllProjects(int pageIndex, int pageSize) {
//		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
//		return getPageByCriteria(criteria, pageIndex, pageSize);
		
		return getAllPaginated(pageIndex, pageSize);
	}

	@Override
	public Page<Project> findByProjectNumber(int pageIndex, int pageSize, String number) {
//		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
//		criteria.add(
//			Restrictions.or(
//				Restrictions.or(
//					Restrictions.ilike("title", number, MatchMode.ANYWHERE),
//					Restrictions.ilike("investmentDestination", number, MatchMode.ANYWHERE)
//				),
//				Restrictions.ilike("number", number, MatchMode.ANYWHERE)
//			)
//		);
//		return getPageByCriteria(criteria, pageIndex, pageSize);
		
		String countQueryString = "Select count(*) from " + entityName;
		String selectQueryString = "From " + entityName;
		String whereQueryString = " where " + "title like '%" + number + "%' or investmentDestination like '%" + number + "%' or number like '%" + number + "%'";
		
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		Query countQuery = session.createQuery(countQueryString + whereQueryString);
		Long totalItems = (Long) countQuery.uniqueResult();
		
		Query selectQuery = session.createQuery(selectQueryString + whereQueryString);
		selectQuery.setFirstResult((pageIndex - 1) * pageSize)
			.setMaxResults(pageSize);
		
		List<Project> elements = (List<Project>) selectQuery.list();
		return new Page<Project>(elements, pageIndex, pageSize, totalItems);
	}
}
