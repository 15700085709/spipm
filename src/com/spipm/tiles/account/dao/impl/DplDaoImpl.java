package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.DplDao;
import com.spipm.tiles.account.entity.Deployment;

@Component
public class DplDaoImpl extends HibernateDao<Deployment> implements DplDao{
	
}
