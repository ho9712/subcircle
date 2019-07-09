package com.subcircle.web.kb.impl;

public class Kb04MyCartCenterServlet extends Kb04Controller
{
	@Override
	public String execute() throws Exception
	{
		this.queryAndShowMyCartData();
		return "kb/myCartCenter.jsp";
	}
}
