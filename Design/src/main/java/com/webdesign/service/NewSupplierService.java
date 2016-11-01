package com.webdesign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.NewSupplierDAOImpl;
import com.webdesign.model.Supplier;
import com.webdesign.model.UserDetail;

@Service
@Transactional
public class NewSupplierService {
@Autowired
public NewSupplierDAOImpl newSupplierDAOImpl;
@Transactional
public void saveOrUpdateSupplier(UserDetail userDetail)
{
	this.newSupplierDAOImpl.saveOrUpdateSupplier(userDetail);
}
@Transactional
public List<UserDetail> listSupplier() {
	return this.newSupplierDAOImpl.listSupplier();
}
@Transactional
public UserDetail getByRoleId()
{
	return this.newSupplierDAOImpl.getByRoleId();
}
@Transactional
public UserDetail getByName(String username)
{
	return this.newSupplierDAOImpl.getByName(username);
}
@Transactional
public void addSupplierAddress(Supplier supplier)
{
	this.newSupplierDAOImpl.addSupplierAddress(supplier);
}
}
