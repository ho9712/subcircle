package com.subcircle.web.kc.impl;

public class Kc03ShowCommentsServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.ShowAllComments();
		return "kc/BookComments.jsp";
	}

}
