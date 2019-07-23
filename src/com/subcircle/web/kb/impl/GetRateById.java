package com.subcircle.web.kb.impl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subcircle.services.kbimpl.Kb06Services;
import com.sun.org.apache.xpath.internal.operations.And;

@WebServlet("/getRateByIdServlet")
public class GetRateById extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String itemId = (String)request.getParameter("kkb101");
		Kb06Services services = new Kb06Services();
		try 
		{
			String score = services.getScoreById(itemId);
			if(score != null && score != "") {
				PrintWriter out = response.getWriter();
				response.setContentType("text");
				out.write(score.substring(0, 3)); //保留小数点后一位
				out.flush();
				out.close();
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
