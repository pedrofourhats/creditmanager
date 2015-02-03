package com.creditmanager.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="contact")
public class Contact extends com.creditmanager.model.Entity {

	@Column(name="date")
	private Date date;
	
	@Column(name="comment")
	private String comment;
	
	@Column(name="userId")
	private Long userId;

	@ManyToOne
	@JoinColumn(name="projectId")
	private Project project;
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	
	public void upadte(Date date, String comment, Long userId, Project project){
		this.date = date;
		this.comment = comment;
		this.userId = userId;
		this.project = project;
	}
}
