package com.subcircle.web.kb.impl;

public class Kb05QueryOrderInfoServlet extends Kb05Controller 
{
	@Override
	public String execute() throws Exception
	{
		this.queryAndShowOrderByNum();
		return "kb/createOrder.jsp";
	}
}
