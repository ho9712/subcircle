package com.subcircle.web.kb.impl;

//�����б�(��״̬)
public class Kb05QueryAllOrderServlet extends Kb05Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.queryAllOrderByState();
		return "kb/orderCenter.jsp";
	}
}
