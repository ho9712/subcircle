package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kc06Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kc06Controller extends KdAbstractController 
{
	public Kc06Controller()
	{
		this.setServices(new Kc06Services());
	}
}
