package com.subcircle.web.kd.impl;

public class Kb02DelShopRecordServlet extends Kb02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delShopRecord();
		this.queryShopRecord();
		return "kd/userpage_shopRecord";
	}

}
