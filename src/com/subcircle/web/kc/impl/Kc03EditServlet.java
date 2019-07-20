package com.subcircle.web.kc.impl;

public class Kc03EditServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.ShowBookDetail();
		return "kc/BookEdit.jsp";
	}

}
