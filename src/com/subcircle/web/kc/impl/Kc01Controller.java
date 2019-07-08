package com.subcircle.web.kc.impl;

import com.subcircle.services.kcimpl.Kc01Services;
import com.subcircle.web.ka.support.KaAbstractController;

public abstract class Kc01Controller extends KaAbstractController 
{

	public Kc01Controller()
	{
		this.setServices(new Kc01Services());
	}

}
