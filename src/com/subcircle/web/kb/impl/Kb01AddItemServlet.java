package com.subcircle.web.kb.impl;

public class Kb01AddItemServlet extends Kb01Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addItem", "ÃÌº”…Ã∆∑");
		return "kb01QueryItems.kbhtml";
	}

}
