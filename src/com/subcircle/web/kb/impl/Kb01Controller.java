package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb01Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb01Controller extends KbAbstractController
{
	public Kb01Controller()
	{
		this.setServices(new Kb01Services());
	}
}
