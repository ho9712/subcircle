package com.subcircle.web.kb.impl;

public class Kb05DelOrderBackCartServlet extends Kb05Controller 
{
	//�Ӵ�֧������ҳ�淵�ع��ﳵҳ��ͬʱ�Ӷ�������ɾ����֧������
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteOrderToPay", "ɾ�������ɹ�");
		return "kb04MyCartCenter.kbhtml";
	}
}
