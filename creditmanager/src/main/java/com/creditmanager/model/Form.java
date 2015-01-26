package com.creditmanager.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="form")
public class Form extends com.creditmanager.model.Entity {
	
	public Form() {
		this.emitionDate = new Date();
	}

	@Column(name="name")
	private String name;
	
	@ManyToOne
	@JoinColumn(name="projectId")
	private Project project;
	
	@Column(name="emitionDate")
	private Date emitionDate;
	
	@Column(name="date")
	private String date;
	
	@Column(name="checkNumber")
	private String checkNumber;
	
	@Column(name="day")
	private String day;
	
	@Column(name="month")
	private String month;
	
	@Column(name="year")
	private String year;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Date getEmitionDate() {
		return emitionDate;
	}

	public void setEmitionDate(Date emitionDate) {
		this.emitionDate = emitionDate;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(String checkNumber) {
		this.checkNumber = checkNumber;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
}