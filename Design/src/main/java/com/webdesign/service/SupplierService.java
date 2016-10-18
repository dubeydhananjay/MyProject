package com.webdesign.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.SupplierDAOImpl;

import com.webdesign.model.Supplier;

@Service
@Transactional
public class SupplierService {
	@Autowired
	private SupplierDAOImpl supplierDAOImpl;
	@Transactional
	public void createSupplier(Supplier supplier)
	{
		this.supplierDAOImpl.createSupplier(supplier);
	}
	@Transactional
	public List<Supplier> listSuppliers() {
		return this.supplierDAOImpl.listSuppliers();
	}
	@Transactional
	public Supplier getByName(String supplierName)
	{
		return this.supplierDAOImpl.getByName(supplierName);
	}
	@Transactional
	public String listSupplier()
	{
		return this.supplierDAOImpl.listSupplier();
	}
	@Transactional
	public Supplier getById(int supplierId)
	{
		return this.supplierDAOImpl.getById(supplierId);
	}
	@Transactional
	public void delete(int supplierId)
	{
		supplierDAOImpl.delete(supplierId);
	}
}

