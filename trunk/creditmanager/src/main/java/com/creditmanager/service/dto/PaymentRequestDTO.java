package com.creditmanager.service.dto;

import java.math.BigDecimal;
import java.util.Date;

public class PaymentRequestDTO {
	
	private BigDecimal quoteAmountPaid;
	
	private Date paymentDate;
	
	private int feeNumber;
	
	private long projectId;
	
	public int getFeeNumber() {
		return feeNumber;
	}

	public void setFeeNumber(int feeNumber) {
		this.feeNumber = feeNumber;
	}
	
	public BigDecimal getQuoteAmountPaid() {
		return quoteAmountPaid;
	}
	
	public void setQuoteAmountPaid(BigDecimal quoteAmountPaid) {
		this.quoteAmountPaid = quoteAmountPaid;
	}
	
	public Date getPaymentDate() {
		return paymentDate;
	}
	
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	
	public long getProjectId() {
		return projectId;
	}
	
	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}
}
