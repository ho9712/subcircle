package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb04Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb04Controller extends KbAbstractController
{
	public Kb04Controller()
	{
		this.setServices(new Kb04Services());
	}
	
}
