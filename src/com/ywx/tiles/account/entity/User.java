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

	/** 登录名称 **/
	private String userName;
	/** 登录密码 **/
	private String password;
	/** 显示名称 **/
	private String displayName;
	/** 用户类型 **/
	private String type;
	/** 性别 **/
	private String gender;
	/** 状态 **/
	private String status;
	/** 本次登录日期 **/
	private Timestamp currentLoginDate;
	/** 上次登录日期 **/
	private Timestamp lastLoginDate;
	/** 登录失败次数 **/
	private Integer FailTimes;
	/** 是否锁定标记：1-锁定，0-否 **/
	private String lockFlag;
	/** 锁定日期 **/
	private Timestamp lockDate;
	/** 联系电话 **/
	private String mobilePhone;
	/** 电子邮箱 **/
	private String email;




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

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCurrentLoginDate() {
		return currentLoginDate;
	}

	public void setCurrentLoginDate(Timestamp currentLoginDate) {
		this.currentLoginDate = currentLoginDate;
	}

	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Integer getFailTimes() {
		return FailTimes;
	}

	public void setFailTimes(Integer failTimes) {
		FailTimes = failTimes;
	}

	public String getLockFlag() {
		return lockFlag;
	}

	public void setLockFlag(String lockFlag) {
		this.lockFlag = lockFlag;
	}

	public Timestamp getLockDate() {
		return lockDate;
	}

	public void setLockDate(Timestamp lockDate) {
		this.lockDate = lockDate;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}





}
