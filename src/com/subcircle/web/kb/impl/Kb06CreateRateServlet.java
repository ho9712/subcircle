package com.subcircle.web.kb.impl;

public class Kb06CreateRateServlet extends Kb06Controller {
	@Override
	public String execute() throws Exception
	{
		this.update("createRate", "���۶���");
		this.update("updateKkb508", "�޸Ķ�������״̬");
		return "kb05QueryAllOrder.kbhtml";
	}
}
