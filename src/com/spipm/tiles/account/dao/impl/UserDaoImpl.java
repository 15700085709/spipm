package com.spipm.tiles.account.dao.impl;

import org.springframework.stereotype.Component;

import com.spipm.core.orm.hibernate.HibernateDao;
import com.spipm.tiles.account.dao.UserDao;
import com.spipm.tiles.account.entity.User;

@Component
public class UserDaoImpl extends HibernateDao<User> implements UserDao{
	
}
