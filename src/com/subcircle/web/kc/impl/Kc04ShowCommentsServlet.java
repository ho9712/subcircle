package com.subcircle.web.kc.impl;

public class Kc04ShowCommentsServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.ShowAllComments();
		return "kc/GameComments.jsp";
	}

}
