package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.EvaluationDao;
import com.spipm.tiles.account.entity.Evaluation;

@Component
public class EvaluationDaoImpl extends HibernateDao<Evaluation> implements EvaluationDao{
	
}
