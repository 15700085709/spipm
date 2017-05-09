package com.spipm.entity;

import java.util.List;

import com.spipm.entity.User;

public interface UserService {

	/**
	 * 获取所有用户.
	 * 
	 * @return
	 */
	List<User> getUserList();

}
