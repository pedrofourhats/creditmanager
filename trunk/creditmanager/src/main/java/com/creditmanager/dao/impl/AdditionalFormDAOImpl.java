package com.creditmanager.dao.impl;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.creditmanager.dao.AdditionalFormDAO;
import com.creditmanager.model.AdditionalForm;
import com.creditmanager.model.Page;

@Repository
public class AdditionalFormDAOImpl extends GenericDAOImpl<AdditionalForm, Long> implements AdditionalFormDAO {

	protected AdditionalFormDAOImpl() {
		super(AdditionalForm.class.getName());
	}

	@Override
	public Page<AdditionalForm> getFormsPage(int pageIndex, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forEntityName(entityName);
		return getPageByCriteria(criteria, pageIndex, pageSize);
	}
}