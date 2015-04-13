package com.creditmanager.dao;

import java.util.Date;
import java.util.List;

import com.creditmanager.model.report.DefaultingProject;
import com.creditmanager.model.report.DefaultingProjectDetail;
import com.creditmanager.model.report.SocioeconomicIndicator;

public interface ReportDAO {
	
	List<DefaultingProject> getDefaultProjects();
	
	List<SocioeconomicIndicator> getSocioeconomicIndicator(Date dateFrom, Date dateTo);
	
	List<DefaultingProjectDetail> getDefaultingProjectDetail();
}
