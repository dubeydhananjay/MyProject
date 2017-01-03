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
public class UserDAOImpl extends AbstractDaoImpl implements UserDAO  {
	

	public void saveOrUpdateUser(UserDetail userDetail) {
		Session session =getCurrentSession();
		
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
		List<UserDetail> userDetailList = getCurrentSession().createQuery("from UserDetail").getResultList();
		
		return userDetailList;
	}
	
	public void addShippingAddress(ShippingAddress shippingAddress)
	{	
		getCurrentSession().saveOrUpdate(shippingAddress);
	}

	public void addBillingAddress(BillingAddress billingAddress)
	{
		getCurrentSession().saveOrUpdate(billingAddress);
	}
	
	public void saveOrUpdateAdmin(UserDetail userDetail)
	{
		Session session =getCurrentSession();
		
		User user  = new User();
		
		user.setUsername(userDetail.getUsername());
		user.setPassword(userDetail.getPassword());
		user.setEnabled(true);
		user.setUserId(userDetail.getUserId());
		session.saveOrUpdate(user);
		
		UserRole userRole  = new  UserRole();
		userRole.setUserId(user.getUserId());
		userRole.setRoleId(3);
		session.saveOrUpdate(userRole);
		
		Cart cart  =new Cart();
		cart.setCartId(user.getUserId());
		cart.setUserId(user.getUserId());
		session.saveOrUpdate(cart);
		
		userDetail.setRoleId(3);
		userDetail.setUserId(user.getUserId());
		userDetail.setCartId(cart.getCartId());
		
		session.saveOrUpdate(userDetail);
		
		session.flush();
	}
	
	public UserDetail getByName(String username)
	{
		
		String query = "from UserDetail where username= '"+username+"'";
		@SuppressWarnings({  "unchecked" })
		List<UserDetail> userList=getCurrentSession().createQuery(query).getResultList();
	    if(userList!=null && !userList.isEmpty())
	    	return userList.get(0);
	    else return null;
	}
	
	@SuppressWarnings("unchecked")
	public ShippingAddress getShippingAddressById(int userId)
	{
		String query ="from ShippingAddress where userdetail_userId= "+userId;
		List<ShippingAddress> shippingList=getCurrentSession().createQuery(query).getResultList();
		 if(shippingList!=null && !shippingList.isEmpty())
		    	return shippingList.get(0);
		    else return null;
		
	}
	
	@SuppressWarnings("unchecked")
	public BillingAddress getBillingAddressById(int userId)
	{
		String query ="from BillingAddress where userdetail_userId= "+userId;
		List<BillingAddress> billingList=getCurrentSession().createQuery(query).getResultList();
		 if(billingList!=null && !billingList.isEmpty())
		    	return billingList.get(0);
		    else return null;
		
	}
	
}
