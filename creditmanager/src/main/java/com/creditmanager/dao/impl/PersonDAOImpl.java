package com.creditmanager.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.model.Page;
import com.creditmanager.model.Person;

@Repository
public class PersonDAOImpl extends GenericDAOImpl<Person, Long> implements PersonDAO {

	protected PersonDAOImpl() {
		super(Person.class.getName());
	}

	@SuppressWarnings("unchecked")
	public List<Person> findByName(String name, String type) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.disjunction()
			.add(Restrictions.ilike("name", name, MatchMode.ANYWHERE))
			.add(Restrictions.ilike("surname", name, MatchMode.ANYWHERE))
		);
		criteria.add(Restrictions.eq("type", type));
		return (List<Person>) getHibernateTemplate().findByCriteria(criteria);
	}

	public Page<Person> getAllPerson(int pageIndex, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.addOrder(Order.asc("surname"));
		return getPageByCriteria(criteria, pageIndex, pageSize);
	}

	@SuppressWarnings("unchecked")
	public Page<Person> getFilteredPerson(int pageIndex, int pageSize, String searchedKeyword) {
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		DetachedCriteria detachedCriteria = DetachedCriteria.forEntityName(entityName);
		Criteria criteria = detachedCriteria.getExecutableCriteria(session);
		
		criteria.add(Restrictions.or(Restrictions.or(
				Restrictions.ilike("surname", searchedKeyword, MatchMode.ANYWHERE),
				Restrictions.ilike("name", searchedKeyword, MatchMode.ANYWHERE)),
				Restrictions.ilike("identityNumber", searchedKeyword, MatchMode.ANYWHERE)));
		criteria.setProjection(Projections.rowCount());
		Long totalItems = (Long) criteria.uniqueResult();
		
		criteria.setProjection(null)
			.setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageSize);
		
		List<Person> persons = (List<Person>) hibernateTemplate.findByCriteria(detachedCriteria);
		return new Page<Person>(persons, pageIndex, pageSize, totalItems);
	}

	@SuppressWarnings("unchecked")
	public List<Person> getByIds(List<Long> ids) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.in("id", ids));
		return (List<Person>) getHibernateTemplate().findByCriteria(criteria);
	}

	public boolean existUserWithEmail(String email) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.eq("email", email));
		return !getHibernateTemplate().findByCriteria(criteria).isEmpty();
	}

	public boolean existUserWithDni(String identityNumber) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.like("identityNumber", "%" + identityNumber));
		return !getHibernateTemplate().findByCriteria(criteria).isEmpty();
	}

	public boolean existPersonWithName(String name, String surname) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.eq("name", name));
		criteria.add(Restrictions.eq("surname", surname));
		return !getHibernateTemplate().findByCriteria(criteria).isEmpty();
	}

	public boolean existPersonWithAddress(String address, String addressNumber, String addressFloor, String addressAppartment, String locality, String province) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		if(address != null) {
			criteria.add(Restrictions.eq("address", address));	
		}
		if(addressNumber != null) {
			criteria.add(Restrictions.eq("addressNumber", addressNumber));
		}
		if(addressFloor != null) {
			criteria.add(Restrictions.eq("addressFloor", addressFloor));
		}
		if(addressAppartment != null) {
			criteria.add(Restrictions.eq("addressAppartment", addressAppartment));
		}
		if(locality != null) {
			criteria.add(Restrictions.eq("locality", locality));
		}
		if(province != null) {
			criteria.add(Restrictions.eq("province", province));
		}
		
		return !getHibernateTemplate().findByCriteria(criteria).isEmpty();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> getByType(String type) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.eq("type", type));
		criteria.add(Restrictions.eq("active", true));
		return (List<Person>) getHibernateTemplate().findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	public Page<Person> getFilteredByType(int pageIndex, int pageSize, String personCategory, String searchedKeyword) {
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		DetachedCriteria detachedCriteria = DetachedCriteria.forEntityName(entityName);
		Criteria criteria = detachedCriteria.getExecutableCriteria(session);
		
		criteria.addOrder(Order.asc("surname"));
		criteria.add(Restrictions.eq("type", personCategory));
		criteria.add(Restrictions.or(Restrictions.or(
				Restrictions.ilike("surname", searchedKeyword, MatchMode.ANYWHERE),
				Restrictions.ilike("name", searchedKeyword, MatchMode.ANYWHERE)),
				Restrictions.ilike("identityNumber", searchedKeyword, MatchMode.ANYWHERE)));
		criteria.setProjection(Projections.rowCount());
		Long totalItems = (Long) criteria.uniqueResult();
		
		criteria.setProjection(null)
			.setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageSize);
		
		List<Person> persons = (List<Person>) hibernateTemplate.findByCriteria(detachedCriteria);
		return new Page<Person>(persons, pageIndex, pageSize, totalItems);
	}

	@SuppressWarnings("unchecked")
	public Page<Person> getAllByType(int pageIndex, int pageSize, String personCategory) {
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		DetachedCriteria detachedCriteria = DetachedCriteria.forEntityName(entityName);
		Criteria criteria = detachedCriteria.getExecutableCriteria(session);
		
		criteria.add(Restrictions.eq("type", personCategory));
		criteria.addOrder(Order.asc("surname"));
		
		criteria.setProjection(Projections.rowCount());
		Long totalItems = (Long) criteria.uniqueResult();
		
		criteria.setProjection(null)
			.setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageSize);
		
		List<Person> persons = (List<Person>) hibernateTemplate.findByCriteria(detachedCriteria);
		return new Page<Person>(persons, pageIndex, pageSize, totalItems);
	}
}