package com.subcircle.web.ka.impl;

public class Ka01AdmPostContentServlet extends Ka01Controller 
{
	    //������ϸ������ʾ
		@Override
		public String execute() throws Exception 
		{
			this.showPostContent();
			this.forumQueryAnswer();
			return "ka/AdministratorPostContent.jsp";
		}
}
