package com.creditmanager.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="additionalForm")
public class AdditionalForm extends com.creditmanager.model.Entity {
	
	public AdditionalForm(){
	}
	
	public AdditionalForm(String fileName, Project project){
		this.fileName = fileName;
		this.uploadedDate = new Date();
		this.project = project;
	}
	
	@Column(name="fileName")
	private String fileName;
	
	@Column(name="uploadedDate")
	private Date uploadedDate;
	
	@ManyToOne
	@JoinColumn(name="projectId")
	private Project project;
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public Date getUploadedDate() {
		return uploadedDate;
	}
	
	public void setUploadedDate(Date uploadedDate) {
		this.uploadedDate = uploadedDate;
	}
	
}
