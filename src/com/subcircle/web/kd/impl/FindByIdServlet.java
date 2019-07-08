package com.subcircle.web.kd.impl;

public class FindByIdServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.findById();
		return "kd/userpage_info";
	}

}
