package com.subcircle.web.kb.impl;

public class Kb05CreateOrderServlet extends Kb05Controller {
	@Override
	public String execute() throws Exception 
	{
		this.update("createOrder", "生成订单(待支付)");
		this.queryAndShowOrderByNum();
		return "kb/createOrder.jsp";
	}

}
