package com.subcircle.web.kb.impl;

public class Kb01FindSimpleItemByIdServlet extends Kb01Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.showMarketItemInfo();		//��ѯ��Ʒ��Ϣ
		return "itemInfo";
	}
}
