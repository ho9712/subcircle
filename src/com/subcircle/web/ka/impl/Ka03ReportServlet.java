package com.subcircle.web.ka.impl;

public class Ka03ReportServlet extends Ka03Controller
{
	    //��Ӿٱ���Ϣ
		@Override
		public String execute() throws Exception 
		{
			this.postReport();
			return "ka01PostContent.kahtml";
		}
}
