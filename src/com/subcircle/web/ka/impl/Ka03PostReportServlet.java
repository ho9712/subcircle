package com.subcircle.web.ka.impl;

public class Ka03PostReportServlet extends Ka03Controller
{
	    //�ٱ�����
		@Override
		public String execute() throws Exception 
		{
			this.postReport();
			return "ka01PostContent.kahtml";
		}
}
