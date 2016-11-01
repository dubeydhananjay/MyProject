package com.webdesign.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.webdesign.model.Cart;
import com.webdesign.model.Supplier;
import com.webdesign.model.User;
import com.webdesign.model.UserDetail;
import com.webdesign.model.UserRole;

@Repository
public class NewSupplierDAOImpl {
	
		@Autowired
		private SessionFactory sessionFactory;

		public void saveOrUpdateSupplier(UserDetail userDetail) {
			Session session =this.sessionFactory.getCurrentSession();
			
			User user  = new User();
			//user.setUserId(userDetails.getUserId());
			user.setUsername(userDetail.getUsername());
			user.setPassword(userDetail.getPassword());
			user.setEnabled(true);
			user.setUserId(userDetail.getUserId());
			session.saveOrUpdate(user);
			
			UserRole userRole  = new  UserRole();
			userRole.setUserId(user.getUserId());
			userRole.setRoleId(2);
			session.saveOrUpdate(userRole);
			
			Cart cart  =new Cart();
			cart.setCartId(user.getUserId());
			cart.setUserId(user.getUserId());
			session.saveOrUpdate(cart);
			
			userDetail.setRoleId(2);
			userDetail.setUserId(user.getUserId());
			userDetail.setCartId(cart.getCartId());
			
			/*userDetail.getSupplier().setUserDetail(userDetail);
			session.saveOrUpdate(userDetail.getSupplier());*/
			session.saveOrUpdate(userDetail);
			session.flush();
			
			
		}
		public List<UserDetail> listSupplier() {
			@SuppressWarnings("unchecked")
			List<UserDetail> listSupplier = this.sessionFactory.getCurrentSession().createQuery("from UserDetail where roleId=2").getResultList();
			
			return listSupplier;
		}
		public UserDetail getByRoleId() {
			String editQuery="from UserDetail where roleId=2";
			@SuppressWarnings({  "unchecked" })
			List<UserDetail> listSupplier=this.sessionFactory.getCurrentSession().createQuery(editQuery).getResultList();
		    if(listSupplier!=null && !listSupplier.isEmpty())
		    	return listSupplier.get(0);
		    else return null;
			
		}

		public UserDetail getByName(String username)
		{
			String query=" from UserDetail where username= '"+username+"'";
			@SuppressWarnings({  "unchecked" })
			List<UserDetail> listSupplier=this.sessionFactory.getCurrentSession().createQuery(query).getResultList();
		    if(listSupplier!=null && !listSupplier.isEmpty())
		    	return listSupplier.get(0);
		    else return null;
		}
		public void addSupplierAddress(Supplier supplier)
		{
			this.sessionFactory.getCurrentSession().saveOrUpdate(supplier);

		}
}
