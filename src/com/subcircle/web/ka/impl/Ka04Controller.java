package com.subcircle.web.ka.impl;

import com.subcircle.services.kaimpl.Ka04Services;
import com.subcircle.web.ka.support.KaAbstractController;

public abstract class Ka04Controller extends KaAbstractController 
{

	public Ka04Controller()
	{
		this.setServices(new Ka04Services());
	}

}