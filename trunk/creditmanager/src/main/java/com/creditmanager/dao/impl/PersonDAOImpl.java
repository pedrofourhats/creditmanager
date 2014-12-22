package com.creditmanager.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
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
	@Override
	public List<Person> findByName(String name) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.ilike("name", name, MatchMode.ANYWHERE));
		return (List<Person>) getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public Page<Person> getAllPerson(int pageIndex, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		return getPageByCriteria(criteria, pageIndex, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<Person> getFilteredPerson(int pageIndex, int pageSize, String searchedKeyword) {
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		DetachedCriteria detachedCriteria = DetachedCriteria.forEntityName(entityName);
		Criteria criteria = detachedCriteria.getExecutableCriteria(session);
		
		criteria.add(Restrictions.or(Restrictions.or(
				Restrictions.ilike("surname", searchedKeyword, MatchMode.ANYWHERE),
				Restrictions.ilike("name", searchedKeyword, MatchMode.ANYWHERE)),
				Restrictions.ilike("identityNumber", searchedKeyword, MatchMode.ANYWHERE)));
		criteria.setProjection(Projections.rowCount());
		Integer totalItems = (Integer) criteria.uniqueResult();
		
		criteria.setProjection(null)
			.setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageSize);
		
		List<Person> persons = (List<Person>) hibernateTemplate.findByCriteria(detachedCriteria);
		return new Page<Person>(persons, pageIndex, pageSize, totalItems);
	}

}
