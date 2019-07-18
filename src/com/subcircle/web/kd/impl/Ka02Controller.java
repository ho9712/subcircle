package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Ka02Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Ka02Controller extends KdAbstractController 
{
	public Ka02Controller()
	{
		this.setServices(new Ka02Services());
	}
}
