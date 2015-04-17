package com.creditmanager.service.dto;

import java.math.BigDecimal;
import java.util.Date;

public class PaymentDTO {

	private Long id;
	
	private int feeNumber;
	
	private BigDecimal feeAmountPaid;
	
	private Date paymentDate;
	
	private String rate;
	
//	private ProjectDTO project;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getFeeNumber() {
		return feeNumber;
	}

	public void setFeeNumber(int feeNumber) {
		this.feeNumber = feeNumber;
	}

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

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

//	public ProjectDTO getProject() {
//		return project;
//	}
//
//	public void setProject(ProjectDTO project) {
//		this.project = project;
//	}	
}
