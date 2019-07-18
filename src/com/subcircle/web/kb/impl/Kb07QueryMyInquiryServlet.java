package com.subcircle.web.kb.impl;

public class Kb07QueryMyInquiryServlet extends Kb07Controller {
	@Override
	public String execute() throws Exception
	{
		this.showUserInquiryList();
		return "kb/myInquiry.jsp";
	}

}
