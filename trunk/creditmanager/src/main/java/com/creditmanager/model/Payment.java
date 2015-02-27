package com.creditmanager.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment extends com.creditmanager.model.Entity implements Comparable<Payment>{
	
	public Payment(){
	}
	
	public Payment(BigDecimal feeAmountPaid, Date paymentDate, int feeNumber, Project project){
		this.feeAmountPaid = feeAmountPaid;
		this.paymentDate = paymentDate;
		this.feeNumber = feeNumber;
		this.project = project;
	}
	
	@Column(name="feeNumber")
	private int feeNumber;
	
	@Column(name="feeAmountPaid")
	private BigDecimal feeAmountPaid;
	
	@Column(name="paymentDate")
	private Date paymentDate;
	
	@ManyToOne
	@JoinColumn(name="projectId")
	private Project project;

	public BigDecimal getFeeAmountPaid() {
		return feeAmountPaid;
	}

	public void setFeeAmountPaid(BigDecimal feeAmountPaid) {
		this.feeAmountPaid = feeAmountPaid;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getFeeNumber() {
		return feeNumber;
	}

	public void setFeeNumber(int feeNumber) {
		this.feeNumber = feeNumber;
	}

	@Override
	public int compareTo(Payment o) {
		if(this.feeNumber == o.feeNumber){
			return 0;
		}
		
		if(this.feeNumber < o.feeNumber){
			return -1;
		} else {
			return 1;
		}
	}
}
