package com.subcircle.web.kb.impl;

public class Kb07UpdateInquiryServlet extends Kb07Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateInquiryState", "更新求购信息状态");
		return "back";
	}

}
