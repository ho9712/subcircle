package com.subcircle.web.ka.impl;

public class Ka03ReportServlet extends Ka03Controller
{
	    //添加举报信息
		@Override
		public String execute() throws Exception 
		{
			this.update("Report","举报");
			return "ka01PostContent.kahtml";
		}
}
