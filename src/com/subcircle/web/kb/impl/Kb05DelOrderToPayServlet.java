package com.subcircle.web.kb.impl;

public class Kb05DelOrderToPayServlet extends Kb05Controller 
{
	//取消订单并返回取消订单的源头
	@Override
	public String execute() throws Exception 
	{
		String toPath = this.updateRtn("deleteOrderToPay", "删除订单");
		return toPath;
	}
}
