package com.subcircle.web.ka.impl;

public class Ka04AddCollectionServlet extends Ka04Controller
{
    //添加收藏贴子
	@Override
	public String execute() throws Exception 
	{
		this.update("addCollection","收藏");
        return "ka01PostContent.kahtml";
	}
}
