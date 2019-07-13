package com.subcircle.web.kb.impl;

//订单列表(各状态)
public class Kb05QueryAllOrderServlet extends Kb05Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.queryAllOrderByState();
		return "kb/orderCenter.jsp";
	}
}
