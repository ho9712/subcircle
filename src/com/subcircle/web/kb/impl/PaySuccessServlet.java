package com.subcircle.web.kb.impl;


import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.subcircle.services.kbimpl.Kb04Services;
import com.subcircle.services.kbimpl.Kb05Services;
import com.subcircle.web.kb.impl.alipayConfig.AlipayConfig;

@WebServlet("/paySuccessServlet")
public class PaySuccessServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		Map<String, String> params = new HashMap<>();
		try
		{
			params = parseParam(request);
		} 
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println("info:"+params);
		
		boolean signVerified = false;
		try 
		{
			signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
		} 
		catch (AlipayApiException e)
		{
			e.printStackTrace();
		} //����SDK��֤ǩ��

		//�������������д���ĳ������´�������ο�������
		if(signVerified)
		{
			//�̻�������
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("�̻�������:"+out_trade_no);
			//֧�������׺�
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("֧�������׺�:"+trade_no);
			
			//������
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("������:"+total_amount);
			//����ɹ�����û����ﳵ�Ƴ��ö�����Ʒ�����¸ö���״̬Ϊ1(���ջ�)
			String mString_1 = "�ӹ��ﳵ���Ƴ��ö�����Ʒ";
			String mString_2 = "���Ķ���״̬";
			String userID = "1";		//�û�ID���޸�
			Kb04Services kb04Services = new Kb04Services();
			Kb05Services kb05Services = new Kb05Services();
			//System.out.println("=============");
			try 
			{
				//System.out.println("hhhhh");
				mString_1 += kb04Services.deleteCartItemsAfterPay(out_trade_no,userID)?"�ɹ�":"ʧ��";
				mString_2 += kb05Services.updateOrderState("1",out_trade_no,userID)?"�ɹ�":"ʧ��";
				//System.out.println(mString_1);
				//System.out.println(mString_2);
				
			} catch (Exception e)
			{
				e.printStackTrace();
			}			
			//out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
		}
		else 
		{
			//out.println("��ǩʧ��");
			System.out.println("��ǩʧ��");
		}
		//�������������д���ĳ������ϴ�������ο�������
		request.getRequestDispatcher("kb/kb01QueryItems.kbhtml").forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	private Map<String,String> parseParam(HttpServletRequest request)throws Exception
	{
		//��ȡ֧����GET����������Ϣ
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//����������δ����ڳ�������ʱʹ��
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		return params;
	}
}
