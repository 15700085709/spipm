package com.spipm.tiles.account.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.spipm.tiles.common.support.UuidEntity;

@Entity
@Table(name = "SPIPM_FEEDBACK")
public class Feedback extends UuidEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322245166615392L;
	
	private String fdbkProject;
	private Timestamp fdbkTime;
	private String fdbkUser;
	private String fdbkContent;
	public String getFdbkProject() {
		return fdbkProject;
	}
	public void setFdbkProject(String fdbkProject) {
		this.fdbkProject = fdbkProject;
	}
	public Timestamp getFdbkTime() {
		return fdbkTime;
	}
	public void setFdbkTime(Timestamp fdbkTime) {
		this.fdbkTime = fdbkTime;
	}
	public String getFdbkUser() {
		return fdbkUser;
	}
	public void setFdbkUser(String fdbkUser) {
		this.fdbkUser = fdbkUser;
	}
	public String getFdbkContent() {
		return fdbkContent;
	}
	public void setFdbkContent(String fdbkContent) {
		this.fdbkContent = fdbkContent;
	}
	
	
}
