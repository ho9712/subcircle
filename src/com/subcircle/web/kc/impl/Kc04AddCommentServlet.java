package com.subcircle.web.kc.impl;

public class Kc04AddCommentServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.AnimeRankAndComment();
		return "Kc04ShowDetail.kchtml";
	}

}
