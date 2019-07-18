package com.subcircle.web.kb.impl;

public class Kb08DeleteResponseServlet extends Kb08Controller 
{
	@Override
	public String execute() throws Exception 
	{
		boolean flag = this.update("deleteResponse");
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
