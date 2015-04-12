package com.creditmanager.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.ReportDAO;
import com.creditmanager.model.report.DefaultingProject;
import com.creditmanager.model.report.SocioeconomicIndicator;
import com.creditmanager.service.ReportService;

@Transactional
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO reportDao;
	
	@Override
	public List<DefaultingProject> getDefaultProjects() {
		return reportDao.getDefaultProjects();
	}

	@Override
	public List<SocioeconomicIndicator> getSocioeconomicIndicator(Date dateFrom, Date dateTo) {
		return reportDao.getSocioeconomicIndicator(dateFrom, dateTo);
	}

}
