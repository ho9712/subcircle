package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb05Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb05Controller extends KbAbstractController {

	
	public Kb05Controller() 
	{
		this.setServices(new Kb05Services());
	}

}
