package com.webdesign.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.NewSupplierDAOImpl;
import com.webdesign.model.UserDetail;

@Service
@Transactional
public class NewSupplierService {
@Autowired
public NewSupplierDAOImpl newSupplierDAOImpl;
@Transactional
public void saveOrUpdate(UserDetail userDetail)
{
	newSupplierDAOImpl.savOrUpdateSupplier(userDetail);
}
}
