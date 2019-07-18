package com.subcircle.web.kc.impl;

public class Kc04DelCommentsServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.DelAnimeComment();
		return "Kc04ShowDetail.kchtml";
	}

}
