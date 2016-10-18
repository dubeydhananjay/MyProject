package com.webdesign.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

import com.webdesign.dao.SupplierDAO;

import com.webdesign.model.Supplier;
@Repository
public class SupplierDAOImpl implements SupplierDAO
{@Autowired
	private SessionFactory sessionFactory;

	public void createSupplier(Supplier supplier) {
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);
		
	}

	public List<Supplier> listSuppliers() {
		@SuppressWarnings({  "unchecked" })
		List<Supplier> supplierList=this.sessionFactory.getCurrentSession().createQuery("from Supplier").getResultList();
		return supplierList;
		
	}

	public String listSupplier()
	{
		@SuppressWarnings({  "unchecked" })
		List<Supplier> supplierList=this.sessionFactory.getCurrentSession().createQuery("from Supplier").getResultList();
		Gson gson = new Gson();
		String json = gson.toJson(supplierList);
		return json;
	}

	public Supplier getByName(String supplierName)
	{
		String query=" from Supplier where supplierName= '"+supplierName+"'";
		@SuppressWarnings({  "unchecked" })
		List<Supplier> supplierList=this.sessionFactory.getCurrentSession().createQuery(query).getResultList();
	    if(supplierList!=null && !supplierList.isEmpty())
	    	return supplierList.get(0);
	    else return null;
	}

	public Supplier getById(int supplierId) {
		String editQuery="from Supplier where supplierId= "+supplierId;
		@SuppressWarnings({  "unchecked" })
		List<Supplier> supplierList=this.sessionFactory.getCurrentSession().createQuery(editQuery).getResultList();
	    if(supplierList!=null && !supplierList.isEmpty())
	    	return supplierList.get(0);
	    else return null;
		
	}

	public void delete(int supplierId) {
		Supplier removeSupplier = new Supplier();
		removeSupplier.setSupplierId(supplierId);
		this.sessionFactory.getCurrentSession().delete(removeSupplier);
		
	}
}
