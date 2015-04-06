package com.creditmanager.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.report.DefaultProjects;
import com.creditmanager.model.report.SocioeconomicIndicator;

@Service
public interface ReportService {
	List<DefaultProjects> getDefaultProjects();
	
	List<SocioeconomicIndicator> getSocioeconomicIndicator(Date dateFrom, Date dateTo);
}
