package com.webdesign.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@SuppressWarnings("serial")
@Entity
public class Person implements Serializable {
	@Id
	String username;
	
	public String getUserame()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username=username;
	}

}
