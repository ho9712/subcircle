package com.subcircle.web.kc.impl;

public class Kc04EditServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.ShowGameDetail();
		return "kc/GameEdit.jsp";
	}

}
