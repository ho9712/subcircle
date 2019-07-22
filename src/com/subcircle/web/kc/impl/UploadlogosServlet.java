package com.subcircle.web.kc.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadlogosServlet
 */
@WebServlet("/uploadlogosServlet")
@MultipartConfig
public class UploadlogosServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			Part part = null;
			String filePath = null;
			String data = null;
			String fileName=null;
			UUID uuid=UUID.randomUUID();
			
	
			if (request.getPart("logos") != null)
			{
				
				part=request.getPart("logos");
				filePath=request.getServletContext().getRealPath("img/logos/");
				fileName=part.getSubmittedFileName();
				data = "/img/logos/"  + uuid+fileName;
				
			}

			
			
			File file=new File(filePath);
			if(!file.exists())
			{
				file.mkdir();
			}
			String url=filePath+uuid+fileName;
			if(fileName.endsWith(".jpg") || fileName.endsWith(".png"))
			{
				part.write(url);
			}
			else
			{
				if(fileName.equals(""))
				{
					request.setAttribute("avatarMsg", "��ѡ��һ���ļ���");
				}
				else
				{
					request.setAttribute("avatarMsg", "��֧��.jpg��.png��ʽ�ļ���");
				}
			}
			PrintWriter out = response.getWriter();
			response.setContentType("text");
			out.write(data); 
			out.flush();
			out.close();
			
		}
		catch (Exception e) 
		{
			request.setAttribute("msg", "��ʾ��������ϣ�");
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
