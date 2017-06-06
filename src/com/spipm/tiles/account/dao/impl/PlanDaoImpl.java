package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.PlanDao;
import com.spipm.tiles.account.entity.Plan;

@Component
public class PlanDaoImpl extends HibernateDao<Plan> implements PlanDao{
	
}
