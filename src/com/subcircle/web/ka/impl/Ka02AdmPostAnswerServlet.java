package com.subcircle.web.ka.impl;

public class Ka02AdmPostAnswerServlet extends Ka02Controller 
{
	//上传评论
	@Override
	public String execute() throws Exception 
	{
		this.update("postContent","回复");
		return "ka01AdmPostContent.kahtml";
	}
}
