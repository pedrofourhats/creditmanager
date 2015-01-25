package com.creditmanager.service.dto;

import java.util.Date;

import javax.persistence.Column;

public class FormDTO {
	private Long id;
	private String name;
	private Date emitionDate;
	private String date;
	private String checkNumber;
	private String day;
	private String month;
	private String year;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
