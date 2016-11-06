package com.webdesign.daoimpl;

import java.util.List;


import org.hibernate.Session;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webdesign.dao.UserDAO;
import com.webdesign.model.BillingAddress;
import com.webdesign.model.Cart;
import com.webdesign.model.ShippingAddress;
import com.webdesign.model.User;
import com.webdesign.model.UserDetail;
import com.webdesign.model.UserRole;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void saveOrUpdateUser(UserDetail userDetail) {
		Session session =this.sessionFactory.getCurrentSession();
		
		User user  = new User();
		
		user.setUsername(userDetail.getUsername());
		user.setPassword(userDetail.getPassword());
		user.setEnabled(true);
		user.setUserId(userDetail.getUserId());
		session.saveOrUpdate(user);
		
		UserRole userRole  = new  UserRole();
		userRole.setUserId(user.getUserId());
		userRole.setRoleId(1);
		session.saveOrUpdate(userRole);
		
		Cart cart  =new Cart();
		cart.setCartId(user.getUserId());
		cart.setUserId(user.getUserId());
		session.saveOrUpdate(cart);
		
		userDetail.setRoleId(1);
		userDetail.setUserId(user.getUserId());
		userDetail.setCartId(cart.getCartId());
		
		/*userDetail.getBillingAddress().setUserDetail(userDetail);
		userDetail.getShippingAddress().setUserDetail(userDetail);
		session.saveOrUpdate(userDetail.getShippingAddress());
		session.saveOrUpdate(userDetail.getBillingAddress());*/
		
		session.saveOrUpdate(userDetail);
		
		session.flush();
		
		
	}

	@SuppressWarnings("unchecked")
	public List<UserDetail> userDetailList() {
		List<UserDetail> userDetailList = this.sessionFactory.getCurrentSession().createQuery("from UserDetail").getResultList();
		
		return userDetailList;
	}
	
	public void addShippingAddress(ShippingAddress shippingAddress)
	{	
		sessionFactory.getCurrentSession().saveOrUpdate(shippingAddress);
	}

	public void addBillingAddress(BillingAddress billingAddress)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(billingAddress);
	}
	
}
