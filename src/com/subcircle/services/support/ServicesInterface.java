package com.subcircle.services.support;

import java.util.ArrayList;
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
	
	default Map<String,Object> queryInMap() throws Exception
	{
		return null;
	}
	
	default List<Object> queryInList() throws Exception
	{
		return null;
	}
	
	default List<Map<String, String>> queryAnimeComment()throws Exception	
	{
		return null;
	}
	default List<Map<String, String>> queryAnimeCommentAll()throws Exception	
	{
		return null;
	}
	default List<Map<String, String>> searchinAnime()throws Exception	
	{
		return null;
	}
	default boolean collectionExsits()throws Exception
	{
		return false;
	}
	default List<Map<String, String>> queryAnimeTopic() throws Exception
	{
		return null;
	}
}
