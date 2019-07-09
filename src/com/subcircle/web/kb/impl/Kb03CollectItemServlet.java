package com.subcircle.web.kb.impl;

public class Kb03CollectItemServlet extends Kb03Controller 
{
	@Override
	public String execute() throws Exception 
	{	
		this.update("insertCollection", "ÃÌº” ’≤ÿ");
		return "ajax"; 
	}
}
