package com.subcircle.web.ka.impl;

public class Ka01AdmDelForumServlet extends Ka01Controller 
{
	    //删除贴子，跳转到论坛主页面
		@Override
		public String execute() throws Exception 
		{
			this.update("delPost","删除");
			return this.queryDelCondition();
		}
}