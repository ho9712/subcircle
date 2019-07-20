package com.subcircle.web.kc.impl;

public class Kc02EditedServlet extends Kc02Controller {

	@Override
	public String execute() throws Exception {
		this.UpdateInfo();
		return "Kc02ShowDetail.kchtml";
	}

}
