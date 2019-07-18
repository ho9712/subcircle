package com.subcircle.web.kc.impl;

public class Kc02UpdateCommentServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.UpdateAnimeComment();
		return "Kc02ShowDetail.kchtml";
	}

}
