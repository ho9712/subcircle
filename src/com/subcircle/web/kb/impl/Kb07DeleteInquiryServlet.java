package com.subcircle.web.kb.impl;

public class Kb07DeleteInquiryServlet extends Kb07Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delInquiryAndSendMsg", "��������Ϣ");
		return "back";
	}

}
