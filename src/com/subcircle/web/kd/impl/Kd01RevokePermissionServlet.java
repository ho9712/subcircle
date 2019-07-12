package com.subcircle.web.kd.impl;

public class Kd01RevokePermissionServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.revokePermission();
		return "kd/workadminpage_queryUser";
	}

}
