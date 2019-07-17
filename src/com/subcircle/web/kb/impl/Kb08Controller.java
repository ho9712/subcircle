package com.subcircle.web.kb.impl;

import com.subcircle.services.kbimpl.Kb08Services;
import com.subcircle.web.kb.support.KbAbstractController;

public abstract class Kb08Controller extends KbAbstractController 
{
	public Kb08Controller() 
	{
		this.setServices(new Kb08Services());
	}
}
