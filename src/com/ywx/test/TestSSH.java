package com.ywx.test;

import static org.junit.Assert.*;

import java.io.Serializable;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ywx.tiles.account.entity.User;
import com.ywx.tiles.dic.dao.DicConfigDao;

public class TestSSH {

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	private ApplicationContext ctx = null;
	
	@Test
	public void tetsDataSource(){
		try {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println("数据源:"+ctx);
		DataSource dataSource = ctx.getBean(DataSource.class);

			System.out.println("打开数据连接："+dataSource.getConnection().toString());

		SessionFactory sessionFactory = ctx.getBean(SessionFactory.class);
		System.out.println("sessionFactory:"+sessionFactory); 
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user =new User();
		user.setUserName("ccc");
		session.save(user);
		user = (User) session.load(User.class, (Serializable) "8c5125ef-3da2-4372-abca-276187439603");
		System.out.println(user.getUserName()+"1111"); 
		tx.commit();
		session.close();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
	
	public void test2(){
	}
	
}
