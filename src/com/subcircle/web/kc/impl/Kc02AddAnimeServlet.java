package com.subcircle.web.kc.impl;

public class Kc02AddAnimeServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.AddAnime();
		return "kc/AddAnime.jsp";
	}

}
