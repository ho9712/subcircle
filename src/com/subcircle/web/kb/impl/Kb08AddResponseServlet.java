package com.subcircle.web.kb.impl;

public class Kb08AddResponseServlet extends Kb08Controller 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addResponse", "œÏ”¶«Ûπ∫");
		return "back";
	}
}
