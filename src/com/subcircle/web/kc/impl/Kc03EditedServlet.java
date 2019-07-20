package com.subcircle.web.kc.impl;

public class Kc03EditedServlet extends Kc03Controller {

	@Override
	public String execute() throws Exception {
		this.UpdateInfoB();
		return "Kc03ShowDetail.kchtml";
	}

}
