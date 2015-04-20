package com.creditmanager.service.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class ProjectDTO {
	
	private Long id;
	
	private String title;
	
	private String type;
	
	private String economicArea;
	
	private String economicActivity;
	
	private String category;
	
	private Double requestedAmount;
	
	private String requestedDeadline;
	
	private int requestedGracePeriod;
	
	private int givenGracePeriod;
	
	private Date deliveryDate;
	
	private String formattedDeliveryDate;
	
	private Double givenAmount;
	
	private int givenDeadline;
	
	private Date dateOfEntry;
	
	private String number;
	
	private String servicers;
	
	private String situationState;
	
	private PersonDTO evaluator;

	private PersonDTO accesor;
	
	private List<PersonDTO> guarantors;
	
	private List<PersonDTO> holders;
	
	private List<FormDTO> forms;
	
	private List<AdditionalFormDTO> additionalForms;
	
	private List<ContactDTO> contacts;
	
	private Set<PaymentDTO> payments;
	
	private String investmentDestination;
	
	private String defaultForms;
	
	private String originalRate;
	
	private String effectiveRate;
	
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

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
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

	public PersonDTO getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(PersonDTO evaluator) {
		this.evaluator = evaluator;
	}

	public PersonDTO getAccesor() {
		return accesor;
	}

	public void setAccesor(PersonDTO accesor) {
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

	public int getRequestedGracePeriod() {
		return requestedGracePeriod;
	}

	public void setRequestedGracePeriod(int requestedGracePeriod) {
		this.requestedGracePeriod = requestedGracePeriod;
	}

	public int getGivenGracePeriod() {
		return givenGracePeriod;
	}

	public void setGivenGracePeriod(int givenGracePeriod) {
		this.givenGracePeriod = givenGracePeriod;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
		this.setFormattedDeliveryDate(deliveryDate);
	}
	
	public String getFormattedDeliveryDate() {
		return formattedDeliveryDate;
	}

	public void setFormattedDeliveryDate(Date deliveryDate) {
		this.formattedDeliveryDate = "";
		if(deliveryDate != null) {
			try {
				SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
				this.formattedDeliveryDate = format.format(deliveryDate);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public Double getGivenAmount() {
		return givenAmount;
	}

	public void setGivenAmount(Double givenAmount) {
		this.givenAmount = givenAmount;
	}

	public int getGivenDeadline() {
		return givenDeadline;
	}

	public void setGivenDeadline(int givenDeadline) {
		this.givenDeadline = givenDeadline;
	}

	public String getDefaultForms() {
		return defaultForms;
	}

	public void setDefaultForms(String defaultForms) {
		this.defaultForms = defaultForms;
	}

	public List<ContactDTO> getContacts() {
		return contacts;
	}

	public void setContacts(List<ContactDTO> contacts) {
		this.contacts = contacts;
	}

	public List<AdditionalFormDTO> getAdditionalForms() {
		return additionalForms;
	}

	public void setAdditionalForms(List<AdditionalFormDTO> additionalForms) {
		this.additionalForms = additionalForms;
	}

	public Set<PaymentDTO> getPayments() {
		return payments;
	}

	public void setPayments(Set<PaymentDTO> payments) {
		this.payments = payments;
	}

	public String getOriginalRate() {
		return originalRate;
	}

	public void setOriginalRate(String originalRate) {
		this.originalRate = originalRate;
	}

	public String getEffectiveRate() {
		return effectiveRate;
	}

	public void setEffectiveRate(String effectiveRate) {
		this.effectiveRate = effectiveRate;
	}
}
