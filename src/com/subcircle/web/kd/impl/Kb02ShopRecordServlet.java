package com.subcircle.web.kd.impl;

public class Kb02ShopRecordServlet extends Kb02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryShopRecord();
		return "kd/userpage_shopRecord";
	}

}
