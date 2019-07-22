package com.subcircle.web.kb.impl;

public class Kb04AddToMyCartServlet extends Kb04Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addToMyCart", "加入购物车");
		return "ajax"; 
	}
}
