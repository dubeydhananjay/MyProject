package com.webdesign.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.webdesign.model.Cart;
import com.webdesign.model.User;
import com.webdesign.model.UserDetail;
import com.webdesign.model.UserRole;

@Repository
public class NewSupplierDAOImpl {
	
		@Autowired
		private SessionFactory sessionFactory;

		public void savOrUpdateSupplier(UserDetail userDetail) {
			Session session =this.sessionFactory.getCurrentSession();
			
			User user  = new User();
			//user.setUserId(userDetails.getUserId());
			user.setUsername(userDetail.getUsername());
			user.setPassword(userDetail.getPassword());
			user.setEnabled(true);
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
			userDetail.getBillingAddress().setUserDetail(userDetail);
			userDetail.getShippingAddress().setUserDetail(userDetail);
			session.saveOrUpdate(userDetail.getShippingAddress());
			session.saveOrUpdate(userDetail.getBillingAddress());
			
			session.saveOrUpdate(userDetail);
			
			session.flush();
			
			
		}
		


}
