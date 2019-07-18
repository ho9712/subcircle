package com.subcircle.web.kc.impl;

public class Kc04UpdateCommentServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.UpdateAnimeComment();
		return "Kc04ShowDetail.kchtml";
	}

}
