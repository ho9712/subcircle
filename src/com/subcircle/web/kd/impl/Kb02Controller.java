package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kb02Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kb02Controller extends KdAbstractController 
{
	public Kb02Controller()
	{
		this.setServices(new Kb02Services());
	}

}
