package com.subcircle.web.ka.impl;

public class Ka04AdmAddCollectionServlet extends Ka04Controller
{
    //����ղ�����
	@Override
	public String execute() throws Exception 
	{
		this.addCollection();
        return "ka01AdmPostContent.kahtml";
	}
}
