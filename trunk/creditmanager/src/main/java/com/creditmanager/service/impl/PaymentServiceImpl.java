package com.creditmanager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.creditmanager.dao.PaymentDAO;
import com.creditmanager.dao.ProjectDAO;
import com.creditmanager.model.Payment;
import com.creditmanager.model.Project;
import com.creditmanager.model.exceptions.PaymentAlreadyCanceledException;
import com.creditmanager.service.PaymentService;
import com.creditmanager.service.dto.PaymentRequestDTO;

@Transactional
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Override
	public void payFee(PaymentRequestDTO paymentRequest) {
		Project project = projectDAO.getById(paymentRequest.getProjectId());
		Payment payment = new Payment(paymentRequest.getQuoteAmountPaid(), paymentRequest.getPaymentDate(),paymentRequest.getFeeNumber(), project);
		paymentDAO.add(payment);
	}

	@Override
	public int getFeeNumberToPay(Long projectId) throws PaymentAlreadyCanceledException {
		Project project = projectDAO.getById(projectId);
		if(!project.isInDebt()){
			throw new PaymentAlreadyCanceledException();
		}
		
		return project.getLastPayment().getFeeNumber() + 1;
	}
}
