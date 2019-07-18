package com.subcircle.web.kd.impl;

public class Kc06DelBookCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delColl();
		this.queryBookColl();
		return "kd/userpage_bookColl";
	}

}
