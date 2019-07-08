package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Kd01Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Kd01Controller extends KdAbstractController 
{

	public Kd01Controller()
	{
		this.setServices(new Kd01Services());
	}

}
