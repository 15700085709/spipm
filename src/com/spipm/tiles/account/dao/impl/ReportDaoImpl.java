package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.ReportDao;
import com.spipm.tiles.account.entity.Report;

@Component
public class ReportDaoImpl extends HibernateDao<Report> implements ReportDao{
	
}
