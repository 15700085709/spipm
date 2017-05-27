package com.ywx.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.ywx.core.orm.hibernate.HibernateDao;
import com.ywx.tiles.account.dao.DplDao;
import com.ywx.tiles.account.entity.Deployment;

@Component
public class DplDaoImpl extends HibernateDao<Deployment> implements DplDao{
	
}
