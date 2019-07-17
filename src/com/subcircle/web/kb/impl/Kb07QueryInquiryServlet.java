package com.subcircle.web.kb.impl;

public class Kb07QueryInquiryServlet extends Kb07Controller {
	@Override
	public String execute() throws Exception 
	{
		this.showInquiryList();
		return "kb/InquiryCenter.jsp";
	}
}
