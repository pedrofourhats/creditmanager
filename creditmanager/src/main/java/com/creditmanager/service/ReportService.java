package com.creditmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creditmanager.model.report.DefaultProjects;

@Service
public interface ReportService {
	List<DefaultProjects> getDefaultProjects();
}
