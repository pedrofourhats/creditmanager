package com.creditmanager.model;

public class CreditManagerError {

	private String error;
	
	private String type;

	public CreditManagerError(String error, String type) {
		this.error = error;
		this.type = type;
	}
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}