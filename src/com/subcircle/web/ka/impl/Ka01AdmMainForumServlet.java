package com.subcircle.web.ka.impl;

public class Ka01AdmMainForumServlet extends Ka01Controller
{
    //��ҳ��
	@Override
	public String execute() throws Exception 
	{
		return this.queryByCondition();
	}

}