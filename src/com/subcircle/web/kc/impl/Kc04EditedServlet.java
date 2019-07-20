package com.subcircle.web.kc.impl;

public class Kc04EditedServlet extends Kc04Controller {

	@Override
	public String execute() throws Exception {
		this.UpdateInfoG();
		return "Kc04ShowDetail.kchtml";
	}

}
