package com.subcircle.web.kb.impl;

public class Kb05DelOrderToPayServlet extends Kb05Controller 
{
	//从订单中心(orderCenter)取消待支付订单并返回orderCenter
	@Override
	public String execute() throws Exception 
	{
		System.out.println("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
		this.update("deleteOrderToPay", "删除订单成功");
		return "back";	
	}

}
