package com.subcircle.web.ka.impl;

public class Ka01AdmDelForumServlet extends Ka01Controller 
{
	    //ɾ�����ӣ���ת����̳��ҳ��
		@Override
		public String execute() throws Exception 
		{
			this.update("delPost","ɾ��");
			return this.queryDelCondition();
		}
}