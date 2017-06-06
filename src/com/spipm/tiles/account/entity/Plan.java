package com.spipm.tiles.account.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.spipm.tiles.common.support.UuidEntity;

@Entity
@Table(name = "SPIPM_PLAN")
public class Plan extends UuidEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322245166615392L;

	private String planProject;
	private String planDescription;
	private Date planStartTime;
	private Date planEndTime;
	private String planContent;
	private String planReceiver;
	private String planState;
	public String getPlanProject() {
		return planProject;
	}
	public void setPlanProject(String planProject) {
		this.planProject = planProject;
	}
	public String getPlanDescription() {
		return planDescription;
	}
	public void setPlanDescription(String planDescription) {
		this.planDescription = planDescription;
	}
	public Date getPlanStartTime() {
		return planStartTime;
	}
	public void setPlanStartTime(Date planStartTime) {
		this.planStartTime = planStartTime;
	}
	public Date getPlanEndTime() {
		return planEndTime;
	}
	public void setPlanEndTime(Date planEndTime) {
		this.planEndTime = planEndTime;
	}
	public String getPlanContent() {
		return planContent;
	}
	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}
	public String getPlanReceiver() {
		return planReceiver;
	}
	public void setPlanReceiver(String planReceiver) {
		this.planReceiver = planReceiver;
	}
	public String getPlanState() {
		return planState;
	}
	public void setPlanState(String planState) {
		this.planState = planState;
	}
	
	
}
