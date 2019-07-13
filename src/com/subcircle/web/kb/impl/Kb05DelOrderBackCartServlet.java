package com.subcircle.web.kb.impl;

public class Kb05DelOrderBackCartServlet extends Kb05Controller 
{
	//从待支付订单页面返回购物车页面同时从订单表中删除待支付订单
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteOrderToPay", "删除订单成功");
		return "kb04MyCartCenter.kbhtml";
	}
}
