package com.subcircle.web.kb.impl;

public class Kb04UpdateMyCartServlet extends Kb04Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateMyCart","更新购物车商品数量");
		//返回更新后的数量
		//this.queryAndShowUpdateCount();
		return "ajax"; //通过响应ajax实现不跳转jsp局部刷新
	}
}
