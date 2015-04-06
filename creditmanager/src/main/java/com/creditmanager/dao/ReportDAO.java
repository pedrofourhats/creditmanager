package com.creditmanager.dao;

import java.util.Date;
import java.util.List;

import com.creditmanager.model.report.DefaultProjects;
import com.creditmanager.model.report.SocioeconomicIndicator;

public interface ReportDAO {
	List<DefaultProjects> getDefaultProjects();
	
	List<SocioeconomicIndicator> getSocioeconomicIndicator(Date dateFrom, Date dateTo);
}
