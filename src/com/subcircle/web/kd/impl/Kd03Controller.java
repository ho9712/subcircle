package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kd03Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kd03Controller extends KdAbstractController
{
	public Kd03Controller()
	{
		this.setServices(new Kd03Services());
	}

}
