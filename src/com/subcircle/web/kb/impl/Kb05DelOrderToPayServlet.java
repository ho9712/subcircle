package com.subcircle.web.kb.impl;

public class Kb05DelOrderToPayServlet extends Kb05Controller 
{
	//�Ӷ�������(orderCenter)ȡ����֧������������orderCenter
	@Override
	public String execute() throws Exception 
	{
		System.out.println("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
		this.update("deleteOrderToPay", "ɾ�������ɹ�");
		return "back";	
	}

}
