package com.subcircle.web.kd.support;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.subcircle.services.kdimpl.Kd01Services;
import com.subcircle.system.tools.Tools;


@WebServlet("/login")
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String toPath=null;
		try 
		{
			Map<String, Object> dto=Tools.createDto(request);
			Kd01Services services=new Kd01Services();
			services.setServicesDto(dto);
			Map<String, String> user=services.findById();
			if(user==null)
			{
				request.setAttribute("usernameError", "此账号不存在！");
				toPath="/kd/login.jsp";
			}
			else if(!user.get("kkd103").equals(dto.get("kkd103")) || !dto.get("kkd104").toString().contains(user.get("kkd104")))
			{
				request.setAttribute("error", "请确认你的用户名、密码及用户组正确！");
				toPath="/kd/login.jsp";
			}
			else
			{
				HttpSession session=request.getSession();
//				session.setAttribute("kkd101", user.get("kkd101"));
//				session.setAttribute("kkd104", user.get("kkd104"));
				session.setAttribute("user", user);
//				request.setAttribute("user", user);
				toPath="/kd/userpage_main.jsp";
			}
		}
		catch (Exception e) 
		{
			request.setAttribute("msg", "提示：网络故障！");
			e.printStackTrace();
		}
		request.getRequestDispatcher(toPath).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
