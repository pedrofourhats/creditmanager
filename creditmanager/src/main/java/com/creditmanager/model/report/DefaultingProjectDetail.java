package com.creditmanager.model.report;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DefaultingProjectDetail {
	
	@Id
	private int rownum;
	
	private String projectNumber;
	
	private String name;
	
	private double givenAmount;
	
	private Date deliveryDate;
	
	private int givenDeadline;
	
	private int paid;
	
	private int unpaid;

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getProjectNumber() {
		return projectNumber;
	}

	public void setProjectNumber(String projectNumber) {
		this.projectNumber = projectNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getGivenAmount() {
		return givenAmount;
	}

	public void setGivenAmount(double givenAmount) {
		this.givenAmount = givenAmount;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public int getGivenDeadline() {
		return givenDeadline;
	}

	public void setGivenDeadline(int givenDeadline) {
		this.givenDeadline = givenDeadline;
	}

	public int getPaid() {
		return paid;
	}

	public void setPaid(int paid) {
		this.paid = paid;
	}

	public int getUnpaid() {
		return unpaid;
	}

	public void setUnpaid(int unpaid) {
		this.unpaid = unpaid;
	}
	
	public String getFormattedDate(){
		return new SimpleDateFormat("dd/MM/yyyy").format(this.deliveryDate);
	}
}
