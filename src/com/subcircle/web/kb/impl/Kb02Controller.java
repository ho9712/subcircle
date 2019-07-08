package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb02Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb02Controller extends KbAbstractController
{
	public Kb02Controller() 
	{
		this.setServices(new Kb02Services());
	}	
}
