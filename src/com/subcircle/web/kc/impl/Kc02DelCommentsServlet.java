package com.subcircle.web.kc.impl;

public class Kc02DelCommentsServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.DelAnimeComment();
		return "Kc02ShowDetail.kchtml";
	}

}
