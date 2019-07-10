package com.subcircle.web.kc.impl;

public class Kc04ShowRankServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.ShowGamebyRank();
		return "kc/GameList";
	}

}
