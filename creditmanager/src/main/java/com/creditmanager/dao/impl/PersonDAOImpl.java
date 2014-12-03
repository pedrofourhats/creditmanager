package com.creditmanager.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.creditmanager.dao.PersonDAO;
import com.creditmanager.model.Person;

@Repository
public class PersonDAOImpl extends GenericDAOImpl<Person, Long> implements PersonDAO {

	protected PersonDAOImpl() {
		super(Person.class.getName());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> findByName(String name) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.ilike("name", name, MatchMode.ANYWHERE));
		return getHibernateTemplate().findByCriteria(criteria);
	}

}
