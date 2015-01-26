package com.creditmanager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.ReportDAO;
import com.creditmanager.model.report.DefaultProjects;
import com.creditmanager.service.ReportService;

@Transactional
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO reportDao;
	
	@Override
	public List<DefaultProjects> getDefaultProjects() {
		return reportDao.getDefaultProjects();
	}

}
