package com.ywx.tiles.account.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import com.ywx.tiles.common.support.UuidEntity;


@Entity
@Table(name = "SPIPM_DPLMT")
public class Deployment extends UuidEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3997322245166615392L;
	
	private int dplVersion;
	private String dplProject;
	private String dplUser;
	private Timestamp createTime;
	private Timestamp dplTime;
	private String dplState;
	private String dplApprover;
	private byte[] dplSql;
	private byte[] dplWar;
	public int getDplVersion() {
		return dplVersion;
	}
	public void setDplVersion(int dplVersion) {
		this.dplVersion = dplVersion;
	}
	public String getDplProject() {
		return dplProject;
	}
	public void setDplProject(String dplProject) {
		this.dplProject = dplProject;
	}
	public String getDplUser() {
		return dplUser;
	}
	public void setDplUser(String dplUser) {
		this.dplUser = dplUser;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getDplTime() {
		return dplTime;
	}
	public void setDplTime(Timestamp dplTime) {
		this.dplTime = dplTime;
	}
	public String getDplState() {
		return dplState;
	}
	public void setDplState(String dplState) {
		this.dplState = dplState;
	}
	public String getDplApprover() {
		return dplApprover;
	}
	public void setDplApprover(String dplApprover) {
		this.dplApprover = dplApprover;
	}
	@Column(columnDefinition = "MediumBlob")
	public byte[] getDplSql() {
		return dplSql;
	}
	public void setDplSql(byte[] dplSql) {
		this.dplSql = dplSql;
	}
	@Column(columnDefinition = "MediumBlob")
	public byte[] getDplWar() {
		return dplWar;
	}
	public void setDplWar(byte[] dplWar) {
		this.dplWar = dplWar;
	}

}
