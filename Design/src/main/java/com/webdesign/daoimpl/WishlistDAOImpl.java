package com.webdesign.daoimpl;


import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.dao.WishlistDAO;

import com.webdesign.model.Wishlist;
@Repository
public class WishlistDAOImpl implements WishlistDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	public void addToWishlist(Wishlist wishlist) {
		sessionFactory.getCurrentSession().saveOrUpdate(wishlist);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Wishlist> getByUserId(int userId)
	{
		String query = "from Wishlist where userId= "+userId;
		List<Wishlist> wishlist=sessionFactory.getCurrentSession().createQuery(query).getResultList();
		if(wishlist!=null && !wishlist.isEmpty())
	    {
	    	return wishlist;
	    }
	    else 
	    	{
	    	return null;
	    	}
		
	}
	
	@SuppressWarnings("unchecked")
	public String stringWishList()
	{
		List<Wishlist> wishlist=sessionFactory.getCurrentSession().createQuery("from Wishlist").getResultList();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(wishlist);
		return json;
	}

	
	
	public Wishlist getByWishlistId(int wishlistId)
	{
		String query = "from Wishlist where wishlistId= "+wishlistId;
		@SuppressWarnings({  "unchecked" })
		List<Wishlist> wishlist=sessionFactory.getCurrentSession().createQuery(query).getResultList();
	    if(wishlist!=null && !wishlist.isEmpty())
	    {
	    	return wishlist.get(0);
	    }
	    else 
	    	{
	    	return null;
	    	}
	    	}
	public void delete(int wishlistId)
	{
		Wishlist removeWishlist = new Wishlist();
		removeWishlist.setWishListId(wishlistId);
		this.sessionFactory.getCurrentSession().delete(removeWishlist);
	}
	
	public void setFlag(int wishlistId)
	{
		String query="update Wishlist set flag=true where wishlistId= "+wishlistId;
		this.sessionFactory.getCurrentSession().createQuery(query).executeUpdate();
	}
		

	

}
