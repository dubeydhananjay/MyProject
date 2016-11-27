package com.webdesign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.WishlistDAOImpl;
import com.webdesign.model.Wishlist;

@Service
@Transactional
public class WishlistService
{
	@Autowired
	private WishlistDAOImpl wishlistDAOImpl;
	
	@Transactional
	public void addToWishlist(Wishlist wishlist)
	{
		this.wishlistDAOImpl.addToWishlist(wishlist);
	}
	
	@Transactional
	public List<Wishlist> getByUserId(int userId)
	{
		return this.wishlistDAOImpl.getByUserId(userId);
	}
	
	@Transactional
	public String stringWishList()
	{
		return this.wishlistDAOImpl.stringWishList();
	}

	
	@Transactional
	public Wishlist getByWishlistId(int wishlistId)
	{
		return this.wishlistDAOImpl.getByWishlistId(wishlistId);
	}
	
	@Transactional
	public void delete(int wishlistId)
	{
		this.wishlistDAOImpl.delete(wishlistId);
	}
	
	@Transactional
	public void setFlag(int wishlistId)
	{
		this.wishlistDAOImpl.setFlag(wishlistId);
	}
}
