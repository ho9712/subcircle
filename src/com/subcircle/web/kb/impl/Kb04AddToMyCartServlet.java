package com.subcircle.web.kb.impl;

public class Kb04AddToMyCartServlet extends Kb04Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addToMyCart", "加入购物车成功");
		return ""; // 返回调用页面
	}
}
