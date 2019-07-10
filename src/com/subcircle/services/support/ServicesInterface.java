package com.subcircle.services.support;

import java.util.List;
import java.util.Map;

public interface ServicesInterface
{
	void setServicesDto(Map<String, Object> dto);
	
	default Map<String,String> findById()throws Exception
	{
		return null;
	}
	
	default List<Map<String, String>> queryByCondition()throws Exception	
	{
		return null;
	}
	
	default List<Map<String, String>> queryAnimeForum()throws Exception	
	{
		return null;
	}

	default Map<String,Object> queryInMap() throws Exception
	{
		return null;
	}

}
