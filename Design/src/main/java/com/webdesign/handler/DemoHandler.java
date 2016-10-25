package com.webdesign.handler;

import org.springframework.stereotype.Component;

import com.webdesign.model.UserDetail;

@Component
public class DemoHandler {
	public UserDetail initFlow()
	{
		return new UserDetail();
	}

}
