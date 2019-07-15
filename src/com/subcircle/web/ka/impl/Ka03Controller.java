package com.subcircle.web.ka.impl;

import com.subcircle.services.kaimpl.Ka03Services;
import com.subcircle.web.ka.support.KaAbstractController;

public abstract class Ka03Controller extends KaAbstractController 
{

	public Ka03Controller()
	{
		this.setServices(new Ka03Services());
	}

}