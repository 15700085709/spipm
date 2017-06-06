package com.spipm.tiles.account.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.spipm.tiles.common.support.UuidEntity;

@Entity
@Table(name = "SPIPM_EVALUATION")
public class Evaluation extends UuidEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322123166615392L;
	
	private String evltProject;
	private String evltTime;
	private String evltUser;
	private String evltContent;
	
	public String getEvltProject() {
		return evltProject;
	}
	public void setEvltProject(String evltProject) {
		this.evltProject = evltProject;
	}
	public String getEvltTime() {
		return evltTime;
	}
	public void setEvltTime(String evltTime) {
		this.evltTime = evltTime;
	}
	public String getEvltUser() {
		return evltUser;
	}
	public void setEvltUser(String evltUser) {
		this.evltUser = evltUser;
	}
	public String getEvltContent() {
		return evltContent;
	}
	public void setEvltContent(String evltContent) {
		this.evltContent = evltContent;
	}
	

}
