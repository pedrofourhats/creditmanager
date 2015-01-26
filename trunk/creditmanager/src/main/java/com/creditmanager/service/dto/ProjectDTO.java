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
	
	private Double requestedAmount;
	
	private String requestedDeadline;
	
	private String requestedGracePeriod;
	
	private Date deliveryDate;
	
	private Double givenAmount;
	
	private String givenDeadline;
	
	private Date dateOfEntry;
	
	private Long number;
	
	private String servicers;
	
	private String situationState;
	
	private String evaluator;

	private String accesor;
	
	private List<PersonDTO> guarantors;
	
	private List<PersonDTO> holders;
	
	private List<FormDTO> forms;
	
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

	public String getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(String evaluator) {
		this.evaluator = evaluator;
	}

	public String getAccesor() {
		return accesor;
	}

	public void setAccesor(String accesor) {
		this.accesor = accesor;
	}

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

	public List<FormDTO> getForms() {
		return forms;
	}

	public void setForms(List<FormDTO> forms) {
		this.forms = forms;
	}

	public String getInvestmentDestination() {
		return investmentDestination;
	}

	public void setInvestmentDestination(String investmentDestination) {
		this.investmentDestination = investmentDestination;
	}

	public Double getRequestedAmount() {
		return requestedAmount;
	}

	public void setRequestedAmount(Double requestedAmount) {
		this.requestedAmount = requestedAmount;
	}

	public String getRequestedDeadline() {
		return requestedDeadline;
	}

	public void setRequestedDeadline(String requestedDeadline) {
		this.requestedDeadline = requestedDeadline;
	}

	public String getRequestedGracePeriod() {
		return requestedGracePeriod;
	}

	public void setRequestedGracePeriod(String requestedGracePeriod) {
		this.requestedGracePeriod = requestedGracePeriod;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public Double getGivenAmount() {
		return givenAmount;
	}

	public void setGivenAmount(Double givenAmount) {
		this.givenAmount = givenAmount;
	}

	public String getGivenDeadline() {
		return givenDeadline;
	}

	public void setGivenDeadline(String givenDeadline) {
		this.givenDeadline = givenDeadline;
	}
}
