package com.subcircle.web.kd.impl;

public class Kb03ShopCollServlet extends Kb03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryShopColl();
		return "kd/userpage_shopColl";
	}

}
