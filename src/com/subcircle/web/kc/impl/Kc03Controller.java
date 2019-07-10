package com.subcircle.web.kc.impl;

import com.subcircle.services.kcimpl.Kc03Services;
import com.subcircle.web.kc.support.KcAbstractController;

public abstract class Kc03Controller extends KcAbstractController {
	
	public Kc03Controller()
	{
		this.setServices(new Kc03Services());
	}
}
