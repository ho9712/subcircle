package com.subcircle.web.kb.impl;

public class Kb01FindItemByIdServlet extends Kb01Controller
{
	/**
	 *	��ת��Ʒ������Ϣҳ�沢Ϊ���ο��û����������¼
	 */
	@Override
	public String execute() throws Exception 
	{
		String userID =  this.showItemInfo();		//��ѯ��Ʒ��Ϣ
		if (userID != null && !userID.equals(""))
		{
			this.update("insertBrowse", "�ҵ�����Ʒ�������µ������¼");	//�����û��������¼
		}
		return "kb/itemInfo.jsp";
	}
}
