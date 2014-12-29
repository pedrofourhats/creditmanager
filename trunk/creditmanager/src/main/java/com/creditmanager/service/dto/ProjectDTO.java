package com.creditmanager.service.dto;

import java.util.Date;
import java.util.List;

public class ProjectDTO {
	
	private Long id;
	
	private String title;
	
	private String type;
	
	private String economicArea;
	
	private String economicActivity;
	
	private String category;
	
	private Date dateOfEntry;
	
	private Long number;
	
	private String servicers;
	
	private String situationState;
	
//	private EvaluatorDTO evaluator;
//
//	private AccesorDTO accesor;
//	
	private List<PersonDTO> guarantors;
	
	private List<PersonDTO> holders;
	
	private String investmentDestination;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEconomicArea() {
		return economicArea;
	}

	public void setEconomicArea(String economicArea) {
		this.economicArea = economicArea;
	}

	public String getEconomicActivity() {
		return economicActivity;
	}

	public void setEconomicActivity(String economicActivity) {
		this.economicActivity = economicActivity;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getDateOfEntry() {
		return dateOfEntry;
	}

	public void setDateOfEntry(Date dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}

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

	public String getSituationState() {
		return situationState;
	}

	public void setSituationState(String situationState) {
		this.situationState = situationState;
	}

//	public EvaluatorDTO getEvaluator() {
//		return evaluator;
//	}
//
//	public void setEvaluator(EvaluatorDTO evaluator) {
//		this.evaluator = evaluator;
//	}
//
//	public AccesorDTO getAccesor() {
//		return accesor;
//	}
//
//	public void setAccesor(AccesorDTO accesor) {
//		this.accesor = accesor;
//	}
//
	public List<PersonDTO> getGuarantors() {
		return guarantors;
	}

	public void setGuarantors(List<PersonDTO> guarantors) {
		this.guarantors = guarantors;
	}

	public List<PersonDTO> getHolders() {
		return holders;
	}

	public void setHolders(List<PersonDTO> holders) {
		this.holders = holders;
	}

	public String getInvestmentDestination() {
		return investmentDestination;
	}

	public void setInvestmentDestination(String investmentDestination) {
		this.investmentDestination = investmentDestination;
	}
}
