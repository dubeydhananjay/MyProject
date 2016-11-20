package com.webdesign.handler;

import org.springframework.stereotype.Component;

import com.webdesign.model.BuyNow;
@Component
public class CartHandler 
{
	 public BuyNow initFlow()
	   {
		return new BuyNow();
	   }


}
