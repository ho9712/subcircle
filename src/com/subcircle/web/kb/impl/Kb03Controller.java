package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb03Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb03Controller extends KbAbstractController
{
	public Kb03Controller() 
	{
		this.setServices(new Kb03Services());
	}	
}
