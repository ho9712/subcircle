package com.subcircle.web.kb.support;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.RowSet;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.web.ControllerInterface;import com.sun.xml.internal.ws.developer.StreamingAttachment;

public abstract class KbAbstractController implements ControllerInterface 
{
	/***********************************************************
	 * 					���þ����Servicesʵ��
	 ***********************************************************/
	
	private ServicesInterface services=null;
	
	protected final void setServices(ServicesInterface services)
	{
		this.services=services;
	}
	
		
	/***********************************************************
	 * 					ΪServices����DTO
	 ***********************************************************/
	
	private Map<String, Object> dto=null;
	
	@Override
	public final void setDto(Map<String, Object> dto) 
	{
		this.dto=dto;
		//��session�ó��û�id��Ȩ�޽���dto
		this.dto.put("kkd101",this.session.getAttribute("kkd101"));
		this.dto.put("kkd104",this.session.getAttribute("kkd104"));
		//ΪServices����DTO
		this.services.setServicesDto(dto);
	}
	
	/***********************************************************
	 * 					����Session
	 ***********************************************************/
	
	private HttpSession session=null;
	
	@Override
	public void setSession(HttpSession session) 
	{
		this.session=session;
	}
	
	/***********************************************************
	 * 					Ϊҳ�洫�����ݷ���
	 ***********************************************************/
	
	private Map<String, Object> attribute=new HashMap<>();
	
	@Override
	public final Map<String, Object> getAttribute() 
	{
		return this.attribute;
	}
	
	private final void saveAttribute(String key,Object value)
	{
		this.attribute.put(key, value);
	}
	
	/***********************************************************
	 * 			ͨ��Serviceʵ�־���ҵ�����������ҳ���ǩ
	 ***********************************************************/
	
	/**
	 * ������ѯ����������ҳ����ʾ�ı�ǩ
	 * @throws Exception
	 */
	protected final void queryAndShow()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "��ƥ������");
		}
	}
	
	/**
	 * ��һ��ѯ����������ҳ����ʾ�ı�ǩ
	 * @throws Exception
	 */
	protected final void findByIdAndShow()throws Exception
	{
		Map<String, String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ���������ѱ�ɾ�����ֹ���ʣ�");
		}
	}
	
	/**
	 * ���²����������ò�����ʾ��Ϣ
	 * @param updateName
	 * @param typeMsg
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeMsg)throws Exception
	{
		String msg=typeMsg+(this.executeMethod(methodName)?"�ɹ�":"ʧ��");
		this.saveAttribute("msg", msg);
	}
	
	protected final void update(String methodName,String typeMsg,String extMsg,String key)throws Exception
	{
		String msg=typeMsg+(this.executeMethod(methodName)?"�ɹ�":"ʧ��");
		msg+=extMsg+this.dto.get(key);
		this.saveAttribute("msg", msg);
	}
	
	protected final boolean update(String methodName)throws Exception
	{
		boolean flag = this.executeMethod(methodName);
		this.saveAttribute("msg", flag);
		return flag;
	}
	
	protected String updateRtn(String methodName,String typeMsg) throws Exception
	{	
		String result = null;
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//���÷���Ȩ�ޣ�ʹ�ܹ�����private����
		method.setAccessible(true);
		result = (String) method.invoke(this.services);

		if (result != null) 
		{
			this.saveAttribute("msg",typeMsg + "�ɹ�");
		}
		else 
		{
			this.saveAttribute("msg",typeMsg + "ʧ��");
		}
		
		return result;
	}
	
	//ͨ��������ƣ����ݷ�����ִ��Services�еķ���
	private boolean executeMethod(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//���÷���Ȩ�ޣ�ʹ�ܹ�����private����
		method.setAccessible(true);
		return (boolean)method.invoke(this.services);
	}
	
	/**
	 * ���²��������²�ѯ
	 * @throws Exception
	 */
	protected final void queryForDelAndShow()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	
	/*********************************************************************
	 * 						������Ҫ�ڴ�д����
	 *********************************************************************/

	/**
	 * 	��ʾ�ܱ��̳���ҳ����Ʒ������Ϣ(����kb01)
	 * @throws Exception
	 */
	protected final void queryAndShowMarketData()throws Exception
	{
		//objMap�а���������Ʒ(�ֲ�ͼ��ʾ)��������Ʒ
		Map<String, Object> objMap =this.services.queryInMap();
		if(objMap.size()>0)
		{
			this.saveAttribute("objMap", objMap);
		}
		else
		{
			this.saveAttribute("msg", "����Ʒ��Ϣ��");
		}
	}
	
	/**
	 * 	��ʾ��Ʒ�����������Ϣ(����kb01)
	 * @throws Exception
	 */
	protected final void showMarketItemInfo() throws Exception
	{
		Map<String, String> ins = this.services.findById();
		this.saveAttribute("msg","����Ʒ���¼ܻ��ֹ����!");
		if(ins != null) 
		{
			this.saveAttribute("msg","��ѯ�ɹ�");
		}
		this.saveAttribute("ins", ins);
	}

	/**
	 * 	�����û�ID��ʾ���ﳵ������Ϣ(����kb04)
	 * @throws Exception
	 */
	protected final void queryAndShowMyCartData()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "���ﳵ�տ���Ҳ��");
		}
	}
	
	/**
	 * 	��ʾ���ﳵ�и��º������(����kb04)
	 * @throws Exception
	 */
//	protected final void queryAndShowUpdateCount()throws Exception
//	{
//		Map<String, String> ins = this.services.findById();
//		if(ins != null)
//		{
//			this.saveAttribute("ins",ins);
//		}
//		else
//		{
//			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
//		}
//	}
	
	/**
	 *	���ݶ�������ʾ�������� (kb05)
	 * @throws Exception
	 */
	protected final void queryAndShowOrderByNum()throws Exception
	{
		List<Map<String, String>> rows=(List<Map<String,String>>)this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
		
		String orderState =(String)this.dto.get("kkb502");
		String backLocation =(String)this.dto.get("backLocation");
		this.saveAttribute("flag", orderState);
		this.saveAttribute("backLocation",backLocation);
	}
	
	/**	(kb05)
	 * 	��������ѯ��״̬�Ķ���
	 * 	���û��鿴��֧�������򷵻ش�֧�������б�
	 */
	protected final void queryAllOrderByState()throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if(objList.size()>0)
		{
			this.saveAttribute("objList",objList);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
		
		String orderState =(String)this.dto.get("kkb502");
		this.saveAttribute("flag", orderState);
	}
	
	/**
	 * 	��ʾ��Ʒ������Ϣ������������Ϣ(kb01)
	 * @return
	 * @throws Exception
	 */
	protected final String showItemInfo() throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if (objList.size() > 0)
		{
			this.saveAttribute("objList", objList);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
		return (String)this.dto.get("kkd101");		//���س�ȥ�ж����û������������Ƿ����������¼
	}
	
	/**
	 *	 �̳ǹ���Ա�޸���Ʒʱ��ѯ������Ʒ����Ϣ(kb01)
	 * @throws Exception
	 */
	protected final void getModifyItemInfo() throws Exception 
	{
		Map<String,String>	ins = this.services.findById();
		if (ins != null && ins.size() > 0)
		{
			this.saveAttribute("ins",ins);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
	}
	
	/**
	 * 	����Ϣ�б�(kb07)
	 * @throws Exception
	 */
	protected final void showInquiryList() throws Exception
	{
		List<Map<String, String>> rows = this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
	}
	
	/**
	 * 	����ĳһ�û��ĸ�״̬����(kb07)
	 * @throws Exception
	 */
	protected final void showUserInquiryList() throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if (objList.size() > 0)
		{
			this.saveAttribute("objList", objList);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
	}
	
	/**
	 * 	����ĳһ�û��ĸ�״̬����Ӧ�б�(kb08)
	 * @throws Exception
	 */
	protected final void showUserResponseList() throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if (objList.size() > 0)
		{
			this.saveAttribute("objList", objList);
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
	}
	
	protected final void showResToInquiry() throws Exception
	{
		Map<String, Object> objMap = this.services.queryInMap();
		if (objMap.size() > 0)
		{
			this.saveAttribute("rows",objMap.get("objMap"));
		}
		else
		{
			this.saveAttribute("msg", "���ݲ����ڻ��ֹ����");
		}
	}
	
}
