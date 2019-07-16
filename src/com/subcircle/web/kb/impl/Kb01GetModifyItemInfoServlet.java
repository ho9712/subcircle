package com.subcircle.web.kb.impl;

public class Kb01GetModifyItemInfoServlet extends Kb01Controller
{
	@Override
	public String execute() throws Exception 
	{
		this.getModifyItemInfo();
		return "kb/addItem.jsp";
	}

}
