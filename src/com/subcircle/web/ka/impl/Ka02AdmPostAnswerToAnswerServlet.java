package com.subcircle.web.ka.impl;

public class Ka02AdmPostAnswerToAnswerServlet extends Ka02Controller 
{
	//�ϴ�����
	@Override
	public String execute() throws Exception 
	{
		this.update("postAnswer","�ظ�");
		return "ka01AdmPostContent.kahtml";
	}
}
