package com.subcircle.web.kb.impl;

public class Kb07UpdateInquiryServlet extends Kb07Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateInquiryState", "��������Ϣ״̬");
		return "back";
	}

}
