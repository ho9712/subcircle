package com.subcircle.web.kd.impl;

public class Kc06ModifyBookCommentServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.modifyComment();
		this.queryBookColl();
		return "kd/userpage_bookColl";
	}

}
