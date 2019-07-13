package com.subcircle.web.kc.impl;

public class Kc03ShowRankServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.ShowBookbyRank();
		return "kc/BookList.jsp";
	}

}
