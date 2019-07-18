package com.subcircle.web.kd.impl;

public class Kc06ModifyGameCommentServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.modifyComment();
		this.queryGameColl();
		return "kd/userpage_gameColl";
	}

}
