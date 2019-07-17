package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Ka03Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Ka03Controller extends KdAbstractController 
{
	public Ka03Controller()
	{
		this.setServices(new Ka03Services());
	}
}
