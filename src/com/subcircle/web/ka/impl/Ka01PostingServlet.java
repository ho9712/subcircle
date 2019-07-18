package com.subcircle.web.ka.impl;

public class Ka01PostingServlet extends Ka01Controller
{
	    //上传贴子
		@Override
		public String execute() throws Exception 
		{
			this.update("posting","发贴");
            return "ka/posting.jsp";
		}
}
