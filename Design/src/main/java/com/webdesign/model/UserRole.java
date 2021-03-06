package com.webdesign.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@Entity
public class UserRole implements Serializable{
	@Id
	private int userId;
	private int roleId;
	
	@OneToOne
	@JoinColumn(name ="roleId" ,nullable=false,insertable=false, updatable=false)
	public Role role;
	
	@OneToOne
	@JoinColumn(name ="userId" ,nullable=false,insertable=false, updatable=false)
	public User user;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
