package com.creditmanager.dao;

import java.util.List;

import com.creditmanager.model.report.DefaultProjects;

public interface ReportDAO {
	List<DefaultProjects> getDefaultProjects();
}
