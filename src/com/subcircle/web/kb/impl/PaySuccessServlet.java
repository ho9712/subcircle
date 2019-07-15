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
		} //调用SDK验证签名

		//——请在这里编写您的程序（以下代码仅作参考）——
		if(signVerified)
		{
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("商户订单号:"+out_trade_no);
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("支付宝交易号:"+trade_no);
			
			//付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("付款金额:"+total_amount);
			//付款成功后从用户购物车移除该订单商品并更新该订单状态为1(待收货)
			String mString_1 = "从购物车中移除该订单商品";
			String mString_2 = "更改订单状态";
			String userID = "1";		//用户ID待修改
			Kb04Services kb04Services = new Kb04Services();
			Kb05Services kb05Services = new Kb05Services();
			//System.out.println("=============");
			try 
			{
				//System.out.println("hhhhh");
				mString_1 += kb04Services.deleteCartItemsAfterPay(out_trade_no,userID)?"成功":"失败";
				mString_2 += kb05Services.updateOrderState("1",out_trade_no,userID)?"成功":"失败";
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
			//out.println("验签失败");
			System.out.println("验签失败");
		}
		//——请在这里编写您的程序（以上代码仅作参考）——
		request.getRequestDispatcher("kb/kb01QueryItems.kbhtml").forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	private Map<String,String> parseParam(HttpServletRequest request)throws Exception
	{
		//获取支付宝GET过来反馈信息
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
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		return params;
	}
}
