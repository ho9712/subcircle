package com.subcircle.web.kb.impl;

public class Kb07DeleteInquiryServlet extends Kb07Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delInquiryAndSendMsg", "驳回求购信息");
		return "back";
	}

}
