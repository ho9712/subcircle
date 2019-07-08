package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kd01Services;
import com.subcircle.web.ka.support.KaAbstractController;

public abstract class Kd01Controller extends KaAbstractController 
{

	public Kd01Controller()
	{
		this.setServices(new Kd01Services());
	}

}
