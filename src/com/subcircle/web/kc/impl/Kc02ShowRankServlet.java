package com.subcircle.web.kc.impl;

public class Kc02ShowRankServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.ShowAnimebyRank();
		return "kc/AnimeList.jsp";
	}

}
