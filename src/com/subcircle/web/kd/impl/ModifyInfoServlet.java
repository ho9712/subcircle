package com.subcircle.web.kd.impl;

public class ModifyInfoServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.modifyInfo();
		return "kd/userpage_info";
	}

}
