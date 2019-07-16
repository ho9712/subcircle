package com.subcircle.web.kb.impl;

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


@WebServlet("/kb01UploadPhotoServlet")
@MultipartConfig
public class Kb01UploadPhotoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			Part part=request.getPart("itemPhoto");
			String fileName=part.getSubmittedFileName();
			String filePath=request.getServletContext().getRealPath("img/item/");
			File file=new File(filePath);
			if(!file.exists())
			{
				file.mkdir();
			}
			UUID uuid=UUID.randomUUID();
			String url=filePath+uuid+fileName;
			System.out.println(url + "========");
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
			String data = "\\item\\"  + uuid+fileName;
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
