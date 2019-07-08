package com.subcircle.web.ka.impl;

import com.subcircle.services.kaimpl.Ka01Services;
import com.subcircle.web.ka.support.KaAbstractController;

public abstract class Ka01Controller extends KaAbstractController 
{

	public Ka01Controller()
	{
		this.setServices(new Ka01Services());
	}

}
