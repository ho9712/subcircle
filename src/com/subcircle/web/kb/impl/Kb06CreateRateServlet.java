package com.subcircle.web.kb.impl;

public class Kb06CreateRateServlet extends Kb06Controller {
	@Override
	public String execute() throws Exception
	{
		this.update("createRate", "评价订单");
		this.update("updateKkb508", "修改订单评价状态");
		return "kb05QueryAllOrder.kbhtml";
	}
}
