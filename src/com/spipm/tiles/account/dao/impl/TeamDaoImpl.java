package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.TeamDao;
import com.spipm.tiles.account.entity.Team;

@Component
public class TeamDaoImpl extends HibernateDao<Team> implements TeamDao{
	
}
