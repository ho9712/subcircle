package com.subcircle.web.ka.impl;

import com.subcircle.services.kaimpl.Ka02Services;
import com.subcircle.web.ka.support.KaAbstractController;

public abstract class Ka02Controller extends KaAbstractController 
{

	public Ka02Controller()
	{
		this.setServices(new Ka02Services());
	}

}