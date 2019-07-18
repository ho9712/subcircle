package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Ka01Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Ka01Controller extends KdAbstractController 
{
	public Ka01Controller()
	{
		this.setServices(new Ka01Services());
	}
}
