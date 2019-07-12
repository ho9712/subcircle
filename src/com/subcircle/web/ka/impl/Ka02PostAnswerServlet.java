package com.subcircle.web.ka.impl;

public class Ka02PostAnswerServlet extends Ka02Controller 
{
	//ÉÏ´«ÆÀÂÛ
	@Override
	public String execute() throws Exception 
	{
		this.update("postContent","1");
		return "ka01PostContent.kahtml";
	}
}