package com.subcircle.web.kb.impl;

public class Kb08AddResponseServlet extends Kb08Controller 
{
	@Override
	public String execute() throws Exception 
	{
		boolean flag = this.update("addResponse");
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
