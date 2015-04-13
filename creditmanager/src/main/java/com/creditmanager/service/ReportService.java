package com.creditmanager.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.report.DefaultingProject;
import com.creditmanager.model.report.DefaultingProjectDetail;
import com.creditmanager.model.report.SocioeconomicIndicator;

@Service
public interface ReportService {
	
	List<DefaultingProject> getDefaultProjects();
	
	List<SocioeconomicIndicator> getSocioeconomicIndicator(Date dateFrom, Date dateTo);
	
	List<DefaultingProjectDetail> getDefaultingProjectDetail();
}
