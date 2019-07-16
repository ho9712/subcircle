package com.subcircle.web.kd.support;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subcircle.services.kdimpl.Kd02Services;
import com.subcircle.system.tools.Tools;

@WebServlet("/getMsg")
public class GetMsgServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			Map<String,Object> dto=Tools.createDto(request);
			Kd02Services services=new Kd02Services();
			services.setServicesDto(dto);
			List<Map<String, String>> msgs=services.queryMsg();
			request.getSession().removeAttribute("msgs");
			request.getSession().setAttribute("msgs", msgs);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
