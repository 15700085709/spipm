package com.ywx.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;
import com.ywx.tiles.account.dao.UserDao;
import com.ywx.tiles.account.entity.User;
import com.ywx.tiles.account.service.UserService;

@Component
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	public List<User> getUserList(){
		return userDao.getAll(); 
	}
	public List<User> getUserBy(final String propertyName, final Object value){
		return userDao.findBy(propertyName, value);
	}
	public List<User> getUserBy(final String propertyName, final Object value, final String propertyName1, final Object value1){
		return userDao.findBy(propertyName, value, propertyName1, value1);
	}
	public List<User> queryForPage(int offset, int length) {
        //查询所有的记录数
        Query query= (Query) userDao.createQuery("from User");    
         query.setFirstResult(offset);
         query.setMaxResults(length);            
         return query.list(); 
        }
	public void deleteById(final Object id){
		userDao.deleteById(id);
	}
}

