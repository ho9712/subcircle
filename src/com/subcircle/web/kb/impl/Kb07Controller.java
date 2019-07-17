package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb07Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb07Controller extends KbAbstractController {

	public Kb07Controller() 
	{
		this.setServices(new Kb07Services());
	}
}
