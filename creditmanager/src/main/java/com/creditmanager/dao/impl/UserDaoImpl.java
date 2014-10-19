package com.creditmanager.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.creditmanager.dao.UserDAO;
import com.creditmanager.model.User;

@Repository
public class UserDaoImpl extends GenericDAOImpl<User, Long> implements UserDAO {

	protected UserDaoImpl() {
		super(User.class.getName());
	}

	@SuppressWarnings("rawtypes")
	@Override
	public User getByUsername(String username) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		criteria.add(Restrictions.eq("username", username));
		List result = getHibernateTemplate().findByCriteria(criteria);
		if(!result.isEmpty()){
			return (User) result.get(0);
		}
		
		return null;
	}
}
