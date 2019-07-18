package com.subcircle.web.kb.impl;

public class Kb08UpdateResponseServlet extends Kb08Controller 
{
	@Override
	public String execute() throws Exception 
	{
		boolean flag = this.update("updateResponse");
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
