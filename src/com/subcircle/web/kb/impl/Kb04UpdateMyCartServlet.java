package com.subcircle.web.kb.impl;

public class Kb04UpdateMyCartServlet extends Kb04Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateMyCart","���¹��ﳵ��Ʒ����");
		//���ظ��º������
		//this.queryAndShowUpdateCount();
		return "ajax"; //ͨ����Ӧajaxʵ�ֲ���תjsp�ֲ�ˢ��
	}
}
