package com.subcircle.web.ka.impl;

public class Ka03ReportServlet extends Ka03Controller
{
	    //添加举报信息
		@Override
		public String execute() throws Exception 
		{
			this.postReport();
			return "ka01PostContent.kahtml";
		}
}
