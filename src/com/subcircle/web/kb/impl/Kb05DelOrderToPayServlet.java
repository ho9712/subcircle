package com.subcircle.web.kb.impl;

public class Kb05DelOrderToPayServlet extends Kb05Controller 
{
	//ȡ������������ȡ��������Դͷ
	@Override
	public String execute() throws Exception 
	{
		String toPath = this.updateRtn("deleteOrderToPay", "ɾ������");
		return toPath;
	}
}
