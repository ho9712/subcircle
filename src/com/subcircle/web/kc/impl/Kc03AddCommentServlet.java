package com.subcircle.web.kc.impl;

public class Kc03AddCommentServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.AnimeRankAndComment();
		return "Kc03ShowDetail.kchtml";
	}

}
