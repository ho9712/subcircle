package com.subcircle.web.kc.impl;

public class Kc02ShowDetailServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.ShowAnimeDetail();
		return "kc/AnimeDetail.jsp";
	}

}
