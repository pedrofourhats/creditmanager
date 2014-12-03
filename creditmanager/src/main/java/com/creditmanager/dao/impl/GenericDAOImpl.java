package com.creditmanager.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.creditmanager.dao.GenericDAO;

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
