package com.creditmanager.service;

import org.springframework.stereotype.Service;

import com.creditmanager.model.exceptions.PaymentAlreadyCanceledException;
import com.creditmanager.service.dto.PaymentRequestDTO;

@Service
public interface PaymentService {
	void payFee(PaymentRequestDTO paymentRequest);
	int getFeeNumberToPay(Long projectId) throws PaymentAlreadyCanceledException;
}
