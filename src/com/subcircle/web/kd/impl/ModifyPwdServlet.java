package com.subcircle.web.kd.impl;

public class ModifyPwdServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.modifyPwd();
		return "kd/userpage_pwd";
	}

}
