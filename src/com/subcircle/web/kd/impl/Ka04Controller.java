package com.subcircle.web.kd.impl;

import com.subcircle.services.kdimpl.Ka04Services;
import com.subcircle.web.kd.support.KdAbstractController;

public abstract class Ka04Controller extends KdAbstractController 
{
	public Ka04Controller()
	{
		this.setServices(new Ka04Services());
	}
}
