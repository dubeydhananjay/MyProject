package com.webdesign.dao;

import java.util.List;

import com.webdesign.model.UserDetail;

public interface UserDAO {
public void saveOrUpdateUser(UserDetail userDetail);
public List<UserDetail> userDetailList();
}
