package com.subcircle.web.ka.impl;

public class Ka02AdmPostAnswerServlet extends Ka02Controller 
{
	//�ϴ�����
	@Override
	public String execute() throws Exception 
	{
		this.update("postContent","�ظ�");
		return "ka01AdmPostContent.kahtml";
	}
}
