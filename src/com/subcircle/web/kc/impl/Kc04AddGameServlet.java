package com.subcircle.web.kc.impl;

public class Kc04AddGameServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.AddGame();
		return "kc/AddGame.jsp";
	}

}
