package com.subcircle.web.kb.impl;

public class Kb03CollectItemServlet extends Kb03Controller 
{
	@Override
	public String execute() throws Exception 
	{	
		boolean flag = this.update("insertCollection");
		if (flag)
		{
			return "ajax";
		}
		else
		{
			return "ajaxFalse";
		}
	}
}
