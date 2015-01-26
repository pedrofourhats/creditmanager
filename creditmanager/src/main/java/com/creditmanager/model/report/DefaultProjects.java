package com.creditmanager.model.report;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DefaultProjects {
	
	@Id
	private Long number;
	
	private String servicers;

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
}
