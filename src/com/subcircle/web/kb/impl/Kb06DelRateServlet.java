package com.subcircle.web.kb.impl;

public class Kb06DelRateServlet extends Kb06Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteRateById", "ɾ������");
		return "back";
	}

}
