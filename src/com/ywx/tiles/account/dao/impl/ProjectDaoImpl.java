package com.ywx.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.ywx.core.orm.hibernate.HibernateDao;
import com.ywx.tiles.account.dao.ProjectDao;
import com.ywx.tiles.account.entity.Project;

@Component
public class ProjectDaoImpl extends HibernateDao<Project> implements ProjectDao{
	
}
