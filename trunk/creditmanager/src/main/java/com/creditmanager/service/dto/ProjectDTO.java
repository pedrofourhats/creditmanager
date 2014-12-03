package com.creditmanager.service.dto;

import java.util.Date;

public class ProjectDTO {
	
	private String title;
	
	private int type;
	
	private String economicArea;
	
	private String economicActivity;
	
	private int category;
	
	private Date dateOfEntry;
	
	private Long number;
	
	private String servicers;
	
	private int state;
	
	private String evaluator;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getEconomicArea() {
		return economicArea;
	}

	public void setEconomicArea(String economicArea) {
		this.economicArea = economicArea;
	}

	public String getEconomicActivity() {
		return economicActivity;
	}

	public void setEconomicActivity(String economicActivity) {
		this.economicActivity = economicActivity;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public Date getDateOfEntry() {
		return dateOfEntry;
	}

	public void setDateOfEntry(Date dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public String getServicers() {
		return servicers;
	}

	public void setServicers(String servicers) {
		this.servicers = servicers;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(String evaluator) {
		this.evaluator = evaluator;
	}
}
