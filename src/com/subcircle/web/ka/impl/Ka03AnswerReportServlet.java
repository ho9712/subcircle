package com.subcircle.web.ka.impl;

public class Ka03AnswerReportServlet extends Ka03Controller
{
	 //�ٱ��ظ�
	@Override
	public String execute() throws Exception 
	{
		this.answerReport();
		return "ka01PostContent.kahtml";
	}
}
