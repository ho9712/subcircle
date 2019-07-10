package com.subcircle.web.kd.support;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.subcircle.services.kdimpl.Kd01Services;


@WebServlet("/uploadAvatar")
@MultipartConfig
public class UploadAvatarServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		try 
		{
			Part part=request.getPart("avatar");
			String fileName=part.getSubmittedFileName();
			String filePath=request.getServletContext().getRealPath("img/avatar/");
			File file=new File(filePath);
			if(!file.exists())
			{
				file.mkdir();
			}
			UUID uuid=UUID.randomUUID();
			String url=filePath+uuid+fileName;
			if(fileName.endsWith(".jpg") || fileName.endsWith(".png"))
			{
				part.write(url);
				Map<String,Object> dto=new HashMap<>();
				dto.put("kkd101", request.getSession().getAttribute("kkd101"));
				dto.put("kkd108", "/avatar/"+uuid+fileName);
				Kd01Services services =new Kd01Services();
				services.setServicesDto(dto);
				if(services.modifyAvatar())
				{
					request.setAttribute("avatarMsg", "头像上传成功！");
					Map<String,String> user=services.findById();
					user.remove("kkd103");
					HttpSession session=request.getSession();
					session.removeAttribute("user");
					session.setAttribute("user", user);
				}
				else
				{
					request.setAttribute("avatarMsg", "头像上传失败，请稍后再试！");
				}
			}
			else
			{
				if(fileName.equals(""))
				{
					request.setAttribute("avatarMsg", "请选择一个文件！");
				}
				else
				{
					request.setAttribute("avatarMsg", "仅支持.jpg或.png格式文件！");
				}
			}
//			Map<String,Object> dto=new HashMap<>();
//			dto.put("kkd101", request.getSession().getAttribute("kkd101"));
//			dto.put("kkd108", "/avatar/"+uuid+fileName);
//			Kd01Services services =new Kd01Services();
//			services.setServicesDto(dto);
//			if(fileName.endsWith(".jpg") || fileName.endsWith(".png"))
//			{
//				if(services.modifyAvatar())
//				{
//					request.setAttribute("avatarMsg", "头像上传成功！");
//					Map<String,String> user=services.findById();
//					user.remove("kkd103");
//					HttpSession session=request.getSession();
//					session.removeAttribute("user");
//					session.setAttribute("user", user);
//				}
//				else
//				{
//					request.setAttribute("avatarMsg", "头像上传失败，请稍后再试！");
//				}
//			}
//			else
//			{
//				if(fileName.equals(""))
//				{
//					request.setAttribute("avatarMsg", "请选择一个文件！");
//				}
//				else
//				{
//					request.setAttribute("avatarMsg", "仅支持.jpg或.png格式文件！");
//				}
//			}
		}
		catch (Exception e) 
		{
			request.setAttribute("msg", "提示：网络故障！");
			e.printStackTrace();
		}
		String toPath=null;
		if("0123".contains(request.getSession().getAttribute("kkd104").toString()))
		{
			toPath="/kd/rootadminpage_info.jsp";
		}
		else
		{
			toPath="/kd/userpage_info.jsp";
		}
		request.getRequestDispatcher(toPath).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
