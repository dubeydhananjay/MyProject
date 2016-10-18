package com.webdesign.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.UserDAOImpl;
import com.webdesign.model.UserDetail;


@Service
@Transactional
public class UserService {
	@Autowired
private UserDAOImpl  userDAOImpl;
@Transactional
public void savOrUpdateUser(UserDetail userDetail)
{
	userDAOImpl.savOrUpdateUser(userDetail);
}
}
