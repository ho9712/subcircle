package com.subcircle.web.kb.impl;

public class Kb01DelItemServlet extends Kb01Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delItem", "œ¬º‹…Ã∆∑");
		return "ajax";
	}

}
