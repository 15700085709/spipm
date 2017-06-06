package com.spipm.tiles.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.hibernate.Query;

import com.spipm.tiles.account.dao.UserDao;
import com.spipm.tiles.account.entity.User;
import com.spipm.tiles.account.service.UserService;

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
	public List<User> queryForPage(int offset, int length, String orderBy, boolean isAsc) {
        //查询所有的记录数
		String hql = "from User ";
		if(orderBy!=null)
			hql += " order by "+ orderBy + (isAsc ? " asc" : " desc");			
        Query query= (Query) userDao.createQuery(hql);    
         query.setFirstResult(offset);
         query.setMaxResults(length); 
         return query.list(); 
        }
	public void deleteById(final Object id){
		try{
			userDao.deleteById(id);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void addUser(User user){
		userDao.save(user);
	}
	public void updateUser(User user){
		userDao.update(user);
	}
	public List<User> getUserList(String orderBy, boolean isAsc){
		return userDao.getAll(orderBy,isAsc); 
    }
	
	public List<User> getUserByHQL(String hql){
		return userDao.createQuery(hql).list();
	}
}

