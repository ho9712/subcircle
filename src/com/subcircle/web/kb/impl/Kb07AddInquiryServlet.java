package com.subcircle.web.kb.impl;

public class Kb07AddInquiryServlet extends Kb07Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addInquiry", "������");
		return "Kb07QueryMyInquiry.kbhtml";
	}

}
