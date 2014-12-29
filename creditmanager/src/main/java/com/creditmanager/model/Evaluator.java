package com.creditmanager.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="evaluator")
public class Evaluator extends com.creditmanager.model.Entity {
	
	@Column(name="name")
	private String name;
	
//	@OneToMany(mappedBy="evaluator")
//	private Set<Project> projects;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

//	public Set<Project> getProjects() {
//		return projects;
//	}
//
//	public void setProjects(Set<Project> projects) {
//		this.projects = projects;
//	}
	
}
