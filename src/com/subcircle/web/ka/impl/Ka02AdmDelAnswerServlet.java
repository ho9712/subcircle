package com.subcircle.web.ka.impl;

public class Ka02AdmDelAnswerServlet extends Ka02Controller 
{
	//�ϴ�����
	@Override
	public String execute() throws Exception 
	{
		this.update("delAnswer","ɾ��");
		this.showPostContent();
		this.forumQueryAnswer();
		return this.queryDelAnswerCondition();
	}
}