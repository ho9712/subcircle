package com.subcircle.web.kc.impl;

public class Kc02AddCommentServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.AnimeRankAndComment();
		return "back";
	}

}
