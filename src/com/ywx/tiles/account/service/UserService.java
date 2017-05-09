package com.ywx.tiles.account.service;

import java.util.List;
import com.ywx.tiles.account.entity.User;

public interface UserService {

	List<User> getUserList();
	List<User> getUserBy(final String propertyName, final Object value);
	List<User> getUserBy(final String propertyName, final Object value, final String propertyName1, final Object value1);
    List<User> queryForPage(int offset, int length);
    void deleteById(final Object id);
    void addUser(User user);
}
