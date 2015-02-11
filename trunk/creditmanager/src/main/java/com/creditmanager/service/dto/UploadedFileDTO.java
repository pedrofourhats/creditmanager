package com.creditmanager.service.dto;

import java.io.Serializable;

public class UploadedFileDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2830080931701342878L;
	
	private String name;
	
	public UploadedFileDTO(){
		super();
	}
	
	public UploadedFileDTO(String name){
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
