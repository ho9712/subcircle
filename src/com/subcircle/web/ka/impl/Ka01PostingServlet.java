package com.subcircle.web.ka.impl;

public class Ka01PostingServlet extends Ka01Controller
{
	    //�ϴ�����
		@Override
		public String execute() throws Exception 
		{
			this.update("posting","����");
            return "ka/posting.jsp";
		}
}
