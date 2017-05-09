package com.spipm.entity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spipm.entity.User;
import com.spipm.entity.UserDao;
import com.spipm.entity.UserService;

@Component
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	public List<User> getUserList(){
		return userDao.getAll(); 
	}
	
}
