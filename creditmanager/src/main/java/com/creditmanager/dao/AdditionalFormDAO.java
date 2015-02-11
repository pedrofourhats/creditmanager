package com.creditmanager.dao;

import com.creditmanager.model.AdditionalForm;
import com.creditmanager.model.Page;

public interface AdditionalFormDAO extends GenericDAO<AdditionalForm, Long> {
	Page<AdditionalForm> getFormsPage(int pageIndex, int pageSize);
}
