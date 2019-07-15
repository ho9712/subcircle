package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kd02Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kd02Controller extends KdAbstractController
{
	public Kd02Controller()
	{
		this.setServices(new Kd02Services());
	}
}
