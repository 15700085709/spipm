package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.ProjectDao;
import com.spipm.tiles.account.entity.Project;

@Component
public class ProjectDaoImpl extends HibernateDao<Project> implements ProjectDao{
	
}
