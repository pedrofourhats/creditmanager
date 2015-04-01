package com.creditmanager.service.dto;

import java.util.Date;

public class FormDTO {
	private Long id;
	private String name;
	private Date emitionDate;
	private String date;
	private String formattedName;
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
		this.setFormattedName(name);
	}
	
	public String getFormattedName() {
		return this.formattedName;
	}
	
	public void setFormattedName(String formattedName) {
		if(formattedName.equals("fianza")) {
			this.formattedName = "Fianza";
		} if(formattedName.equals("mutuoAsociativoConGracia")) {
			this.formattedName = "Mutuo Asociativo Con Gracia";
		} else if(formattedName.equals("mutuoAsociativoSinGracia")) {
			this.formattedName = "Mutuo Asociativo Sin Gracia";
		} else if(formattedName.equals("mutuoIndividualConGracia")) {
			this.formattedName = "Mutuo Individual Con Gracia";
		} else if(formattedName.equals("mutuoIndividualSinGracia")) {
			this.formattedName = "Mutuo Individual Sin Gracia";
		} else if(formattedName.equals("ordenDePago")) {
			this.formattedName = "Orden De Pago";
		} else if(formattedName.equals("pagare")) {
			this.formattedName = "Pagare";
		} else if(formattedName.equals("politicaCredilicia")) {
			this.formattedName = "Politica Credilicia";
		} else if(formattedName.equals("paymentSchedule")) {
			this.formattedName = "Cronograma De Pagos";
		} 
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
