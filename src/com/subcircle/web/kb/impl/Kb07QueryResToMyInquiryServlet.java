package com.subcircle.web.kb.impl;

public class Kb07QueryResToMyInquiryServlet extends Kb07Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.showResToInquiry();
		return "kb/resToMyInquiry.jsp";
	}

}
