package com.subcircle.web.ka.impl;

public class Ka01AdmMainForumServlet extends Ka01Controller
{
    //Ö÷Ò³Ãæ
	@Override
	public String execute() throws Exception 
	{
		return this.queryByCondition();
	}

}