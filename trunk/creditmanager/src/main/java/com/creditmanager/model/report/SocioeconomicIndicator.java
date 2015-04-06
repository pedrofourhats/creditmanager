package com.creditmanager.model.report;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SocioeconomicIndicator {
	
	@Id
	private int rowNumber;
	
	private int total;
	
	private int aprobados;
	
	private int evaluacion;
	
	private int rechazado;
	
	private int inti;
	
	private int inta;
	
	private int industria;
	
	private int agropecuario;
	
	private int servicios;
	
	private int nuevo;
	
	private int existente;
	
	private int individual;
	
	private int asociativo;

	public int getRowNumber() {
		return rowNumber;
	}

	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getAprobados() {
		return aprobados;
	}

	public void setAprobados(int aprobados) {
		this.aprobados = aprobados;
	}

	public int getEvaluacion() {
		return evaluacion;
	}

	public void setEvaluacion(int evaluacion) {
		this.evaluacion = evaluacion;
	}

	public int getRechazado() {
		return rechazado;
	}

	public void setRechazado(int rechazado) {
		this.rechazado = rechazado;
	}

	public int getInti() {
		return inti;
	}

	public void setInti(int inti) {
		this.inti = inti;
	}

	public int getInta() {
		return inta;
	}

	public void setInta(int inta) {
		this.inta = inta;
	}

	public int getIndustria() {
		return industria;
	}

	public void setIndustria(int industria) {
		this.industria = industria;
	}

	public int getAgropecuario() {
		return agropecuario;
	}

	public void setAgropecuario(int agropecuario) {
		this.agropecuario = agropecuario;
	}

	public int getServicios() {
		return servicios;
	}

	public void setServicios(int servicios) {
		this.servicios = servicios;
	}

	public int getNuevo() {
		return nuevo;
	}

	public void setNuevo(int nuevo) {
		this.nuevo = nuevo;
	}

	public int getExistente() {
		return existente;
	}

	public void setExistente(int existente) {
		this.existente = existente;
	}

	public int getIndividual() {
		return individual;
	}

	public void setIndividual(int individual) {
		this.individual = individual;
	}

	public int getAsociativo() {
		return asociativo;
	}

	public void setAsociativo(int asociativo) {
		this.asociativo = asociativo;
	}
}
