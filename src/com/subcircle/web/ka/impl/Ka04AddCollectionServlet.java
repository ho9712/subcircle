package com.subcircle.web.ka.impl;

public class Ka04AddCollectionServlet extends Ka04Controller
{
    //����ղ�����
	@Override
	public String execute() throws Exception 
	{
		this.update("addCollection","�ղ�");
        return "ka01PostContent.kahtml";
	}
}
