package com.subcircle.web.ka.impl;

public class Ka02PostAnswerServlet extends Ka02Controller 
{
	//上传评论
	@Override
	public String execute() throws Exception 
	{
		this.update("postContent","回复");
		return "ka01PostContent.kahtml";
	}
}