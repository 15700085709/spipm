package com.ywx.tiles.account.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ywx.tiles.common.support.UuidEntity;
@Entity
@Table(name = "SPIPM_TEAM")
public class Team extends UuidEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322258166616392L;
	
	private String teamCode;
	private String teamName;
	private String teamLeader;
	private String teamNumber;
	private String teamWork;
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamLeader() {
		return teamLeader;
	}
	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}
	public String getTeamNumber() {
		return teamNumber;
	}
	public void setTeamNumber(String teamNumber) {
		this.teamNumber = teamNumber;
	}
	public String getTeamWork() {
		return teamWork;
	}
	public void setTeamWork(String teamWork) {
		this.teamWork = teamWork;
	}
	
}
