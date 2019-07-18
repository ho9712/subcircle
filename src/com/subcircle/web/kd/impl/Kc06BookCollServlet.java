package com.subcircle.web.kd.impl;

public class Kc06BookCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryBookColl();
		return "kd/userpage_bookColl";
	}

}
