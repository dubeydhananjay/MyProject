package com.webdesign.dao;

import java.util.List;


import com.webdesign.model.Supplier;

public interface SupplierDAO 
{
	public void createSupplier(Supplier supplie);
	public List<Supplier> listSuppliers();
	public Supplier getById(int supplierId);
	public void delete(int supplierId);
}
