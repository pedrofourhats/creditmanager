package com.creditmanager.dao.impl;

import org.springframework.stereotype.Repository;

import com.creditmanager.dao.PaymentDAO;
import com.creditmanager.model.Payment;

@Repository
public class PaymentDAOImpl extends GenericDAOImpl<Payment, Long> implements PaymentDAO {

	protected PaymentDAOImpl() {
		super(Payment.class.getName());
	}
}
