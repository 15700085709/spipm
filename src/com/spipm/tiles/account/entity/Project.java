package com.spipm.tiles.account.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.spipm.tiles.common.support.UuidEntity;
/**
 * 项目信息.<br>
 * 使用JPA annotation定义ORM关系.
 */
@Entity
@Table(name = "SPIPM_PROJECT")
public class Project extends UuidEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322258166615392L;
	
	/** 项目代码 **/
	private String proCode;
	/** 项目名称 **/
	private String proName;
	/** 项目描述 **/
	private String proDescription;
	/** 项目负责人 **/
	private String manager;
	/** 项目进度 **/
	private String process;
	/** 项目开始时间**/
	private Date proStartTime;
	/** 项目结束时间**/
	private Date proEndTime;
	
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProDescription() {
		return proDescription;
	}
	public void setProDescription(String proDescription) {
		this.proDescription = proDescription;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public Date getProStartTime() {
		return proStartTime;
	}
	public void setProStartTime(Date proStartTime) {
		this.proStartTime = proStartTime;
	}
	public Date getProEndTime() {
		return proEndTime;
	}
	public void setProEndTime(Date proEndTime) {
		this.proEndTime = proEndTime;
	}
	
	
	
	
	
}
