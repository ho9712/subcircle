package com.subcircle.web.kb.impl;

public class Kb05DelOrderToPayServlet extends Kb05Controller 
{
	//从待支付订单页面返回购物车页面同时从订单表中删除待支付订单
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteOrderToPay", "返回购物车页面");
		return "kb04MyCartCenter.kbhtml";	
	}

}
