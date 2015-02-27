package com.creditmanager.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.creditmanager.model.exceptions.PaymentAlreadyCanceledException;
import com.creditmanager.service.PaymentService;
import com.creditmanager.service.dto.PaymentRequestDTO;

@RestController
public class PaymentRestController extends GenericApiController {
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public @ResponseBody void Pay(@RequestBody PaymentRequestDTO paymentRequest){
		paymentService.payFee(paymentRequest);
	}
	
	@RequestMapping(value="/payment/project/{projectId}", method=RequestMethod.GET)
	public @ResponseBody int getFeeNumberToPay(@PathVariable long projectId) throws PaymentAlreadyCanceledException{
		return paymentService.getFeeNumberToPay(projectId);
	}
}
