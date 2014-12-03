package com.creditmanager.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="project")
public class Project extends com.creditmanager.model.Entity {
	
	/* Aspectos */
	@Column(name="title")
	private String title;
	
	@Column(name="type")
	private int type;
	
	@Column(name="economicArea")
	private String economicArea;
	
	@Column(name="economicActivity")
	private String economicActivity;
	
	@Column(name="category")
	private int category;
	
	/* Institucional */
	@Column(name="dateOfEntry")
	private Date dateOfEntry;
	
	@Column(name="number")
	private Long number;
	
	@Column(name="servicers")
	private String servicers;
	
	@Column(name="state")
	private int state;
	
	@Column(name="evaluator")
	private String evaluator;
	
	public Long getNumber() {
		return number;
	}
	public void setNumber(Long number) {
		this.number = number;
	}
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
