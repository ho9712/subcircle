package com.subcircle.web.kb.impl;

public class Kb01QueryItemsServlet extends Kb01Controller {

	@Override
	public String execute() throws Exception 
	{
		this.queryAndShowMarketData();
		return "kb/marketCenter.jsp";
	}
}
