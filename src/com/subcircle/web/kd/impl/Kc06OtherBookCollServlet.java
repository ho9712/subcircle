package com.subcircle.web.kd.impl;

public class Kc06OtherBookCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryBookColl();
		this.otherInfo();
		return "kd/otheruser_bookColl";
	}

}
