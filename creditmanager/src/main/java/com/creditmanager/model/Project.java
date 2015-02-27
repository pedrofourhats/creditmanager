package com.creditmanager.model;

import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="project")
public class Project extends com.creditmanager.model.Entity {
	
	/* Aspectos Economicos*/
	@Column(name="title")
	private String title;
	
	@Column(name="type")
	private String type;
	
	@Column(name="economicArea")
	private String economicArea;
	
	@Column(name="economicActivity")
	private String economicActivity;
	
	@Column(name="category")
	private String category;
	
	/* Aspectos Financieros */
	@Column(name="requestedAmount")
	private Double requestedAmount;
	
	@Column(name="requestedDeadline")
	private String requestedDeadline;
	
	@Column(name="requestedGracePeriod")
	private String requestedGracePeriod;
	
	@Column(name="deliveryDate")
	private Date deliveryDate;
	
	@Column(name="givenAmount")
	private Double givenAmount;
	
	@Column(name="givenDeadline")
	private int givenDeadline;
	
	/* Institucional */
	@Column(name="dateOfEntry")
	private Date dateOfEntry;
	
	@Column(name="number")
	private String number;
	
	@Column(name="servicers")
	private String servicers;
	
	@Column(name="situationState")
	private String situationState;
	
	@Column(name="evaluator")
	private String evaluator;
	
	@Column(name="accesor")
	private String accesor;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="projectGuarantor", 
		joinColumns = { @JoinColumn(name="projectId", nullable=false, updatable=false) },
		inverseJoinColumns = { @JoinColumn(name="personId", nullable=false, updatable=false) }
	)
	private Set<Person> guarantors;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="projectHolder",
		joinColumns = { @JoinColumn(name="projectId", nullable=false, updatable=false) },
		inverseJoinColumns = { @JoinColumn(name="personId", nullable=false, updatable=false) }
	)
	private Set<Person> holders;
	
	@OneToMany(mappedBy="project")
	private Set<Form> forms;
	
	@Column(name="defaultForms")
	private String defaultForms;
	
	@Column(name="investmentDestination")
	private String investmentDestination;
	
	@OneToMany(mappedBy="project")
	private Set<Contact> contacts;
	
	@OneToMany(mappedBy="project")
	private Set<AdditionalForm> additionalForms;
	
	@OneToMany(mappedBy="project")
	private Set<Payment> payments;
	
	public Project(){
	}
	
	public Project(Date dateOfEntry, String number, String servicers, String situationState, String evaluator, String accesor, 
			Set<Person> guarantors, Set<Person> holders, String investmentDestination) {
		this.dateOfEntry = dateOfEntry;
		this.number = number;
		this.servicers = servicers;
		this.situationState = situationState;
		this.evaluator = evaluator;
		this.accesor = accesor;
		this.guarantors = guarantors;
		this.holders = holders;
		this.investmentDestination = investmentDestination;
	}
	
	public Project(Date dateOfEntry, String number, String servicers, String situationState, String evaluator, String accesor, 
			Set<Person> guarantors, Set<Person> holders, String investmentDestination, String title, String type,
			String economicArea, String economicActivity, String category, Double requestedAmount, 
			String requestedDeadline, String requestedGracePeriod, Date deliveryDate, Double givenAmount,
			int givenDeadline) {
		this.dateOfEntry = dateOfEntry;
		this.number = number;
		this.servicers = servicers;
		this.situationState = situationState;
		this.evaluator = evaluator;
		this.accesor = accesor;
		this.guarantors = guarantors;
		this.holders = holders;
		this.investmentDestination = investmentDestination;
		//Aspectos economicos
		this.title = title;
		this.type = type;
		this.economicArea = economicArea;
		this.economicActivity = economicActivity;
		this.category = category;
		//Aspectos Financieros
		this.requestedAmount = requestedAmount;
		this.requestedDeadline = requestedDeadline;
		this.requestedGracePeriod = requestedGracePeriod;
		this.deliveryDate = deliveryDate;
		this.givenAmount = givenAmount;
		this.givenDeadline = givenDeadline;
		
	}

	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
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
	public Set<Person> getGuarantors() {
		return guarantors;
	}
	public void setGuarantors(Set<Person> guarantors) {
		this.guarantors = guarantors;
	}
	public Set<Person> getHolders() {
		return holders;
	}
	public void setHolders(Set<Person> holders) {
		this.holders = holders;
	}
	
	public Set<Form> getForms() {
		return forms;
	}

	public void setForms(Set<Form> forms) {
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

	public Set<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}

	public Set<AdditionalForm> getAdditionalForms() {
		return additionalForms;
	}

	public void setAdditionalForms(Set<AdditionalForm> additionalForms) {
		this.additionalForms = additionalForms;
	}

	public Set<Payment> getPayments() {
		return payments;
	}

	public void setPayments(Set<Payment> payments) {
		this.payments = payments;
	}

	public void update(Date dateOfEntry, String number, String servicers, String situationState, Set<Person> guarantors, Set<Person> holders, 
		String investmentDestination,String title, String type, String economicArea, String economicActivity, String category, Double requestedAmount, String requestedDeadline,
		String requestedGracePeriod, Date deliveryDate, Double givenAmount, int givenDeadline, String defaultForms){
		
		this.title = title;
		this.type = type;
		this.economicArea = economicArea;
		this.economicActivity = economicActivity;
		this.category = category;
		this.requestedAmount = requestedAmount;
		this.requestedDeadline = requestedDeadline;
		this.requestedGracePeriod = requestedGracePeriod;
		this.deliveryDate = deliveryDate;
		this.givenAmount = givenAmount;
		this.givenDeadline = givenDeadline;
		
		this.dateOfEntry = dateOfEntry;
		this.number = number;
		this.servicers = servicers;
		this.situationState = situationState;
		this.guarantors = guarantors;
		this.holders = holders;
		this.investmentDestination = investmentDestination;
		this.defaultForms = defaultForms;
	}
	
	public boolean isInDebt(){
		return payments.size() < givenDeadline;
	}
	
	public Payment getLastPayment(){
		TreeSet<Payment> sortedPayments = new TreeSet<Payment>(payments);
		return sortedPayments.last();
	}
}
