package com.creditmanager.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.creditmanager.dao.GenericDAO;
import com.creditmanager.model.Page;

public abstract class GenericDAOImpl<T, PK extends Serializable> implements GenericDAO<T, PK> {

	@Autowired(required = true)
	protected HibernateTemplate hibernateTemplate;
	
	protected String entityName;
	
	protected GenericDAOImpl(String entityName) {
		this.entityName = entityName;
	}
	
	protected String getEntityName() {
		return this.entityName;
	}
	
	protected HibernateTemplate getHibernateTemplate() {
		return this.hibernateTemplate;
	}
	
	@SuppressWarnings("unchecked")
	protected Page<T> getPageByCriteria(DetachedCriteria detachedCriteria, int pageIndex, int pageSize) {
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		Criteria criteria = detachedCriteria.getExecutableCriteria(session);
		
		criteria.setProjection(Projections.rowCount());
		Long totalItems = (Long) criteria.uniqueResult();
		
		criteria.setProjection(null)
			.setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageSize);
		
		List<T> elements = (List<T>) hibernateTemplate.findByCriteria(detachedCriteria);
		
		return new Page<T>(elements, pageIndex, pageSize, totalItems);
	}
	
	
	public Page<T> getAllPaginated(int pageIndex, int pageSize){
		String countQueryString = "Select count(*) from " + entityName;
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		Query countQuery = session.createQuery(countQueryString);
		Long totalItems = (Long) countQuery.uniqueResult();
		
		Query selectQuery = session.createQuery("From " + entityName);
		selectQuery.setFirstResult((pageIndex - 1) * pageSize)
			.setMaxResults(pageSize);
		
		List<T> elements = (List<T>) selectQuery.list();
		return new Page<T>(elements, pageIndex, pageSize, totalItems);
	}
	
	public void add(T t) {
		hibernateTemplate.saveOrUpdate(t);
	}
	
	public void delete(T t) {
		hibernateTemplate.delete(t);
	}
	
	@SuppressWarnings("unchecked")
	public T getById(PK id) {
		return (T)hibernateTemplate.get(entityName, id);
	}
	
	@SuppressWarnings({ "unchecked" })
	public List<T> getAll(){
		return (List<T>)hibernateTemplate.find("from " + entityName);
	}
}
