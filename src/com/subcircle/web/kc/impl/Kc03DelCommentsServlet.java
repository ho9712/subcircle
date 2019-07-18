package com.subcircle.web.kc.impl;

public class Kc03DelCommentsServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.DelAnimeComment();
		return "Kc03ShowDetail.kchtml";
	}

}
