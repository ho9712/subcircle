package com.subcircle.web.kb.impl;

public class Kb04DelFromMyCartServlet extends Kb04Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteFromMyCart","�Ƴ����ﳵ");
		return "";	//������һҳ��
	}

}
