package com.subcircle.web.kc.impl;

public class Kc02ShowCommentsServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.ShowAllComments();
		return "kc/AnimeComments.jsp";
	}

}
