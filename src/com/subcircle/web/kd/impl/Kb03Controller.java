package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kb03Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kb03Controller extends KdAbstractController
{
	public Kb03Controller()
	{
		this.setServices(new Kb03Services());
	}

}
