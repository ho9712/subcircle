package com.subcircle.web.kd.impl;

public class Kc06ModifyAnimeCommentServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.modifyComment();
		this.queryAnimeColl();
		return "kd/userpage_animeColl";
	}

}
