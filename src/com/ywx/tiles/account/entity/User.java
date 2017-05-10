package com.ywx.tiles.account.entity;

import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.ywx.tiles.common.support.UuidEntity;

/**
 * 用户信息.<br>
 * 使用JPA annotation定义ORM关系.
 */
@Entity
@Table(name = "SPIPM_USER")
public class User extends UuidEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322258166615391L;

	/** 职工ID **/
	private String userId;
	/** 职工名字 **/
	private String userName;
	/** 登录密码 **/
	private String password;
	/** 用户类型 **/
	private String type;
	/** 性别 **/
	private String gender;
	/** 联系电话 **/
	private String phone;
	/** 电子邮箱 **/
	private String email;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}





}
