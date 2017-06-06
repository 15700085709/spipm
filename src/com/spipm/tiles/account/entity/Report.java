package com.spipm.tiles.account.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.spipm.tiles.common.support.UuidEntity;
@Entity
@Table(name = "SPIPM_REPORT")
public class Report extends UuidEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3991232245166615392L;
	
	private Timestamp reportDate;
	private String reportUser;
	private String reportProject;
	private String reportContent;
	private String reportRemark;
	private String appendContent;
	
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportUser() {
		return reportUser;
	}
	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
	}
	public String getReportProject() {
		return reportProject;
	}
	public void setReportProject(String reportProject) {
		this.reportProject = reportProject;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportRemark() {
		return reportRemark;
	}
	public void setReportRemark(String reportRemark) {
		this.reportRemark = reportRemark;
	}
	public String getAppendContent() {
		return appendContent;
	}
	public void setAppendContent(String appendContent) {
		this.appendContent = appendContent;
	}
	
	

}
