package com.subcircle.web.ka.impl;

public class Ka01AnimeForumServlet extends Ka01Controller {

	@Override
	public String execute() throws Exception 
	{
		this.forumToAnime();
		return "ka/animeForum.jsp";
	}

}
