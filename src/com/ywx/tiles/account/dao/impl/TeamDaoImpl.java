package com.ywx.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.ywx.core.orm.hibernate.HibernateDao;
import com.ywx.tiles.account.dao.TeamDao;
import com.ywx.tiles.account.entity.Team;

@Component
public class TeamDaoImpl extends HibernateDao<Team> implements TeamDao{
	
}
