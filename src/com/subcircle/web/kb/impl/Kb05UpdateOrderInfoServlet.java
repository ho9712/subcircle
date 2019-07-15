package com.subcircle.web.kb.impl;

public class Kb05UpdateOrderInfoServlet extends Kb05Controller
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateOrderInfo", "更新订单备注");
		return "ajax";
	}

}
