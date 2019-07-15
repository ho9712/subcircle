package com.subcircle.web.kc.impl;

public class Kc02SearchServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.SearchinAnime();
		return "kc/AnimeShowSearchResult.jsp";
	}

}
