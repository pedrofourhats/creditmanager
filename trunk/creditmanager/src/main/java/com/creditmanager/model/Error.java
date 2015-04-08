package com.creditmanager.model;

public class Error {

	private String error;

	public Error(String error) {
		this.error = error;
	}
	
	public String getId() {
		return error;
	}

	public void setId(String error) {
		this.error = error;
	}
}
