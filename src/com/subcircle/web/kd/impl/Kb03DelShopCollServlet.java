package com.subcircle.web.kd.impl;

public class Kb03DelShopCollServlet extends Kb03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delShopColl();
		this.queryShopColl();
		return "kd/userpage_shopColl";
	}

}
