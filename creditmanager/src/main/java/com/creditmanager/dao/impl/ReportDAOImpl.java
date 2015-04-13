package com.creditmanager.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.creditmanager.dao.ReportDAO;
import com.creditmanager.model.report.DefaultingProject;
import com.creditmanager.model.report.DefaultingProjectDetail;
import com.creditmanager.model.report.SocioeconomicIndicator;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	protected HibernateTemplate hibernateTemplate;
	
	@Override
	public List<DefaultingProject> getDefaultProjects() {
		Query query = getCurrentSession().createSQLQuery(
				"CALL rep_defaultingProjects()")
				.addEntity(DefaultingProject.class);
		List result = query.list();
		
		return result;
	}

	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<SocioeconomicIndicator> getSocioeconomicIndicator(Date dateFrom, Date dateTo) {
		Query query = getCurrentSession().createSQLQuery(
			"CALL rep_SocioeconomicIndicator(:dateFrom, :dateTo)")
			.addEntity(SocioeconomicIndicator.class)
			.setParameter("dateFrom", dateFrom)
			.setParameter("dateTo", dateTo);
		
		List result = query.list();
		return result;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<DefaultingProjectDetail> getDefaultingProjectDetail() {
		Query query = getCurrentSession().createSQLQuery(
				"CALL rep_defaultingProjectsDetail()")
				.addEntity(DefaultingProjectDetail.class);
		List result = query.list();
		
		return result;
	}
	
	private Session getCurrentSession() {
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}
}
