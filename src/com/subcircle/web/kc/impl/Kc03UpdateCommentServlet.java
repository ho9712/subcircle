package com.subcircle.web.kc.impl;

public class Kc03UpdateCommentServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.UpdateAnimeComment();
		return "Kc03ShowDetail.kchtml";
	}

}
