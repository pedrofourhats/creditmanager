package com.creditmanager.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
	private String givenDeadline;
	
	/* Institucional */
	@Column(name="dateOfEntry")
	private Date dateOfEntry;
	
	@Column(name="number")
	private Long number;
	
	@Column(name="servicers")
	private String servicers;
	
	@Column(name="situationState")
	private String situationState;
	
//	@ManyToOne
//	@JoinColumn(name="evaluatorId")
//	private Evaluator evaluator;
	
//	@ManyToOne
//	@JoinColumn(name="accesorId")
//	private Accesor accesor;
	
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
	
	private String investmentDestination;
	
	public Project(){
	}
	
	public Project(Date dateOfEntry, Long number, String servicers, String situationState, /*Evaluator evaluator, Accesor accesor,*/ 
			Set<Person> guarantors, Set<Person> holders, String investmentDestination){
		this.dateOfEntry = dateOfEntry;
		this.number = number;
		this.servicers = servicers;
		this.situationState = situationState;
//		this.evaluator = evaluator;
//		this.accesor = accesor;
		this.guarantors = guarantors;
		this.holders = holders;
		this.investmentDestination = investmentDestination;
	}
	
	public Long getNumber() {
		return number;
	}
	public void setNumber(Long number) {
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
//	public Evaluator getEvaluator() {
//		return evaluator;
//	}
//	public void setEvaluator(Evaluator evaluator) {
//		this.evaluator = evaluator;
//	}
//	public Accesor getAccesor() {
//		return accesor;
//	}
//	public void setAccesor(Accesor accesor) {
//		this.accesor = accesor;
//	}
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
	
	public void update(Date dateOfEntry, Long number, String servicers, String situationState, 
		//Set<Person> guarantors, Set<Person> holders, 
		String investmentDestination,
		String title, String type, String economicArea, String category, Double requestedAmount, String requestedDeadline,
		String requestedGracePeriod, Date deliveryDate, Double givenAmount, String givenDeadline){
		
		this.title = title;
		this.type = type;
		this.economicArea = economicArea;
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
		this.investmentDestination = investmentDestination;
	}
}
