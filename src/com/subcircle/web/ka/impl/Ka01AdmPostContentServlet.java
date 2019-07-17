package com.subcircle.web.ka.impl;

public class Ka01AdmPostContentServlet extends Ka01Controller 
{
	    //贴子详细界面显示
		@Override
		public String execute() throws Exception 
		{
			this.showPostContent();
			this.forumQueryAnswer();
			return "ka/AdministratorPostContent.jsp";
		}
}
