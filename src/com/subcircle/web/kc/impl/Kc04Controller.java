package com.subcircle.web.kc.impl;

import com.subcircle.services.kcimpl.Kc04Services;
import com.subcircle.web.kc.support.KcAbstractController;

public abstract class Kc04Controller extends KcAbstractController {
	
	public Kc04Controller()
	{
		this.setServices(new Kc04Services());
	}
	
}
