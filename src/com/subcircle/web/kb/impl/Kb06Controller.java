package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb06Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb06Controller extends KbAbstractController {

	public Kb06Controller() 
	{
		this.setServices(new Kb06Services());
	}
}
