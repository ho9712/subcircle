package com.subcircle.web.ka.impl;

public class Ka02PostAnswerToAnswerServlet extends Ka02Controller 
{
	//�ϴ�����
	@Override
	public String execute() throws Exception 
	{
		this.update("postAnswer","1");
		return "ka01PostContent.kahtml";
	}
}
