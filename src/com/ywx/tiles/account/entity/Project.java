package com.ywx.tiles.account.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.ywx.tiles.common.support.UuidEntity;
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
	/** 项目信息 **/
	private String proInfo;
	/** 项目经理 **/
	private String manager;
	/** 项目进度 **/
	private String process;
	/** 项目计划 **/
	private byte[] proPlan;
	/** 文件名称 **/
	private String fileName;
	
	
	
	
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
	public String getProInfo() {
		return proInfo;
	}
	public void setProInfo(String proInfo) {
		this.proInfo = proInfo;
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
	@Column(columnDefinition = "MediumBlob")
	public byte[] getProPlan() {
		return proPlan;
	}
	public void setProPlan(byte[] proPlan) {
		this.proPlan = proPlan;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
