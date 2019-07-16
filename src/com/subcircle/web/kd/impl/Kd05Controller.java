package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kd05Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kd05Controller extends KdAbstractController 
{
	public Kd05Controller()
	{
		this.setServices(new Kd05Services());
	}
}
