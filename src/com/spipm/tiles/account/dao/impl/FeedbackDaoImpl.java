package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.FeedbackDao;
import com.spipm.tiles.account.entity.Feedback;

@Component
public class FeedbackDaoImpl extends HibernateDao<Feedback> implements FeedbackDao{
	
}
