package com.subcircle.web.kb.impl;

public class Kb01ModifyItemInfoServlet extends Kb01Controller 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyItemInfo","�޸���Ʒ��Ϣ");
		return "kb01QueryItems.kbhtml";
	}

}
