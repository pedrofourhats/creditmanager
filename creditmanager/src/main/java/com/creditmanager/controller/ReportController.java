package com.creditmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	@RequestMapping(value="/report/list")
    public String goToList(Model model) {
        return "content/report/list";
    }
	
	@RequestMapping(value="/report/defaulters")
    public String goToDefaulters(Model model) {
        return "content/report/defaulters";
    }
	
	@RequestMapping(value="/report/datosFiliatoriosTitulares")
    public String goToDatosFiliatoriosTitulares(Model model) {
        return "content/report/datosFiliatoriosTitulares";
    }
	
	@RequestMapping(value="/report/reporteDeMora")
    public String goToReporteDeMora(Model model) {
        return "content/report/reporteDeMora";
    }
	
	@RequestMapping(value="/report/carteraDeCreditosActivos")
    public String goToCarteraDeCreditosActivos(Model model) {
        return "content/report/carteraDeCreditosActivos";
    }
	
	@RequestMapping(value="/report/indicadoresSocioEconomicos")
    public String goToIndicadoresSocioEconomicos(Model model) {
        return "content/report/indicadoresSocioEconomicos";
    }
	
	@RequestMapping(value="/report/registroDePagos")
    public String goToRegistroDePagos(Model model) {
        return "content/report/registroDePagos";
    }
	
	@RequestMapping(value="/report/movimientos")
    public String goToMovimientos(Model model) {
        return "content/report/movimientos";
    }
	
	@RequestMapping(value="/report/creditosOtorgados")
    public String goToCreditosOtorgados(Model model) {
        return "content/report/creditosOtorgados";
    }
	
	@RequestMapping(value="/report/cobranzas")
    public String goToCobranzas(Model model) {
        return "content/report/cobranzas";
    }
	
	@RequestMapping(value="/report/estadoDeCartera")
    public String goToEstadoDeCartera(Model model) {
        return "content/report/estadoDeCartera";
    }
	
	@RequestMapping(value="/report/movimientoDeBanco")
    public String goToMovimientoDeBanco(Model model) {
        return "content/report/movimientoDeBanco";
    }
	

	
}