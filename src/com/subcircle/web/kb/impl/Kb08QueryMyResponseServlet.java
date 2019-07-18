package com.subcircle.web.kb.impl;

public class Kb08QueryMyResponseServlet extends Kb08Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.showUserResponseList();
		return "kb/myResponse.jsp";
	}

}
