package com.creditmanager.controller.api;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.model.report.DefaultingProject;
import com.creditmanager.model.report.DefaultingProjectDetail;
import com.creditmanager.model.report.SocioeconomicIndicator;
import com.creditmanager.service.ReportService;

@RestController
public class ReportRestController {

	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/report/api/socioeconomicIndicator", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<SocioeconomicIndicator> getSocEcIndicatorReport(String dateFrom, String dateTo) throws ParseException{
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = formatter.parse(dateFrom);
		Date endDate = formatter.parse(dateTo);
		return reportService.getSocioeconomicIndicator(startDate, endDate);
	}
	
	@RequestMapping(value="/report/api/defaultingProjects", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<DefaultingProject> getDefaultinProjectsReport(){
		return reportService.getDefaultProjects();
	}
	
	@RequestMapping(value="/report/api/defaultingProjectsDetail", method=RequestMethod.GET, consumes="*/*")
	public @ResponseBody List<DefaultingProjectDetail> getDefaultinProjectsDetailReport(){
		return reportService.getDefaultingProjectDetail();
	}
}
