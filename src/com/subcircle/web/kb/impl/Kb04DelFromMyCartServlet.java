package com.subcircle.web.kb.impl;

public class Kb04DelFromMyCartServlet extends Kb04Controller 
{
	@Override
	public String execute() throws Exception 
	{
		boolean flag = this.update("deleteFromMyCart");
		if (flag)
		{
			return "ajax";		//ִ�гɹ�
		}
		else 
		{
			return "ajaxFalse";
		}
	}
}
