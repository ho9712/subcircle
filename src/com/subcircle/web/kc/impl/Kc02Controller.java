package com.subcircle.web.kc.impl;

import com.subcircle.services.kcimpl.Kc02Services;
import com.subcircle.web.kc.support.KcAbstractController;

public abstract class Kc02Controller extends KcAbstractController {

	public Kc02Controller()
	{
		this.setServices(new Kc02Services());
	}

}
