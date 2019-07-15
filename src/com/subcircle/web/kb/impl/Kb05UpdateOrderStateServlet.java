package com.subcircle.web.kb.impl;

public class Kb05UpdateOrderStateServlet extends Kb05Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("UpdateOrderState", "¸üÐÂ¶©µ¥×´Ì¬");
		return "kb05QueryAllOrder.kbhtml";
	}
}
