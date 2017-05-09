package com.spipm.entity;

import org.springframework.stereotype.Component;

import com.spipm.entity.User;
import com.spipm.entity.UserDao;
import com.ywx.core.orm.hibernate.HibernateDao;

@Component
public class UserDaoImpl extends HibernateDao<User> implements UserDao{
	
}
