package com.webdesign.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Person {
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
