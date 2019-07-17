package com.subcircle.web.ka.impl;

public class Ka02AdmDelAnswerServlet extends Ka02Controller 
{
	//ÉÏ´«ÆÀÂÛ
	@Override
	public String execute() throws Exception 
	{
		this.update("delAnswer","É¾³ý");
		this.showPostContent();
		this.forumQueryAnswer();
		return this.queryDelAnswerCondition();
	}
}