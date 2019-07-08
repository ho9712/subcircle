package com.subcircle.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ControllerInterface 
{
	void setDto(Map<String, Object> dto);
	
	String execute() throws Exception;
	
	Map<String, Object> getAttribute();
	
	default void setSession(HttpSession session)
	{
		return;
	}
}
