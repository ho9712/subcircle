package com.subcircle.web.kc.impl;

public class Kc02EditServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.ShowAnimeDetail();
		return "kc/AnimeEdit.jsp";
	}

}
