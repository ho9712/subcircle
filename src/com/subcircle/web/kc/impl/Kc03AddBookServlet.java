package com.subcircle.web.kc.impl;

public class Kc03AddBookServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.AddBook();
		return "kc/AddBook.jsp";
	}

}
