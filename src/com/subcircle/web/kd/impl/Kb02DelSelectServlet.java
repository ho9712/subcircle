package com.subcircle.web.kd.impl;

public class Kb02DelSelectServlet extends Kb02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delSelect();
		this.queryShopRecord();
		return "kd/userpage_shopRecord";
	}

}
