package com.subcircle.web.kb.impl;

public class Kb05UpdateOrderInfoServlet extends Kb05Controller
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateOrderInfo", "���¶�����ע");
		return "ajax";
	}

}
