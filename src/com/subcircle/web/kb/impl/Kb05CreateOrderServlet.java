package com.subcircle.web.kb.impl;

public class Kb05CreateOrderServlet extends Kb05Controller {
	@Override
	public String execute() throws Exception 
	{
		this.update("createOrder", "���ɶ���(��֧��)");
		this.queryAndShowOrderToPay();
		return "kb/createOrder.jsp";
	}

}
