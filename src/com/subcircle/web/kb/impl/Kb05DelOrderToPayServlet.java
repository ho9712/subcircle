package com.subcircle.web.kb.impl;

public class Kb05DelOrderToPayServlet extends Kb05Controller 
{
	//�Ӵ�֧������ҳ�淵�ع��ﳵҳ��ͬʱ�Ӷ�������ɾ����֧������
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteOrderToPay", "���ع��ﳵҳ��");
		return "kb04MyCartCenter.kbhtml";	
	}

}
