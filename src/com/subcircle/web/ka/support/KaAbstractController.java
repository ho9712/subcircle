package com.subcircle.web.ka.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.web.ControllerInterface;

public abstract class KaAbstractController implements ControllerInterface 
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
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		this.dto.put("kkd104", this.session.getAttribute("kkd104"));
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
	

	
	//ͨ��������ƣ����ݷ�����ִ��Services�еķ���
	private boolean executeMethod(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//���÷���Ȩ�ޣ�ʹ�ܹ�����private����
		method.setAccessible(true);
		return (boolean)method.invoke(this.services);
	}
	
	
	private List<Map<String,Object>> executeHotPost(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//���÷���Ȩ�ޣ�ʹ�ܹ�����private����
		method.setAccessible(true);
		return (List<Map<String,Object>>)method.invoke(this.services);
	}
	

	
	/*********************************************************************
	 * 						������Ҫ�ڴ�д����
	 *********************************************************************/
	
	/**
	 *  �������Ͳ�ѯ��������ģ��ƥ���ѯ
	 * @throws Exception
	 */
	protected final String queryByCondition()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}
		
		if(this.dto.get("id").toString().equals("0"))
		{
			return "ka/mainForum.jsp";
		}
		else if(this.dto.get("id").toString().equals("1"))
		{
			return "ka/animeForum.jsp";
		}
		else if(this.dto.get("id").toString().equals("2"))
		{
			return "ka/bookForum.jsp";
		}
		else
		{
			return "ka/gameForum.jsp";
		}
	}
	
	

	/**
	 * 	��ʾ������������
	 * @throws Exception
	 */
	protected final void showPostContent() throws Exception
	{
		Map<String, String> ins = this.services.findById();
        this.saveAttribute("ins", ins);
	}
	
	
	
	/**
	 * ��������������ҳ  ��ʾ�����û��ظ�/�����б�
	 * @throws Exception
	 */
	protected final void forumQueryAnswer()throws Exception
	{
		Map<String, Object> objMap =this.services.queryInMap();
		if(objMap.size()>0)
		{
			this.saveAttribute("rows", objMap.get("queryForAnswer"));
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	
	/**
	 * �ظ�����
	 * @throws Exception
	 */
	protected final String postContent() throws Exception
	{   
		if (this.session.getAttribute("kkd101")==null|| this.session.getAttribute("kkd101").toString().equals("")) 
	   {
		  return "kd/nologin.jsp";
	   } 
		else
		{	
	      this.executeMethod("postContent");
	      this.saveAttribute("msg", "�ظ��ɹ���");
		  return "ka01PostContent.kahtml";
		}
	}
	
	
	
	/**
	 * �ٱ�Υ������
	 * @throws Exception
	 */
	protected final void postReport()throws Exception
	{
		if(this.executeMethod("reportPost"))
		{
			this.saveAttribute("msg", "�ٱ��ɹ�");
		}
		else
		{
			this.saveAttribute("msg", "�ٱ�ʧ��");
		}
	}
	
	/**
	 * �ٱ�Υ��ظ�
	 * @throws Exception
	 */
	protected final void answerReport()throws Exception
	{
		if(this.executeMethod("reportAnswer"))
		{
			this.saveAttribute("msg", "�ٱ��ɹ�");
		}
		else
		{
			this.saveAttribute("msg", "�ٱ�ʧ��");
		}
	}
	
	
	
	/**
	 * ��ѯִ��ɾ�����Ӳ�����������б�
	 * @return
	 * @throws Exception
	 */
	protected final String queryDelCondition()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}
		return "ka/mainForum.jsp";
	}
	
	
	/**
	 *��ѯɾ�����ӻظ���������б�
	 * @return
	 * @throws Exception
	 */
	protected final String queryDelAnswerCondition()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}
		return "ka01AdmPostContent.kahtml";
	}
	
	
	
	/**
	 * ����ղ�
	 * @throws Exception
	 */
	protected final void addCollection()throws Exception
	{
		if( this.executeMethod("addCollection"))
		{
			this.saveAttribute("msg", "�ղسɹ���");
		}
		else
		{		
		   this.saveAttribute("msg", "�ղ�ʧ�ܣ����Ѿ��ղع������ӡ�");
		}
	}

	
	/**
	 * ��ѯ�ȵ�����
	 * @throws Exception
	 */
	protected final void hotPost()throws Exception
	{
		
		List<Map<String,Object>> rows1=this.executeHotPost("queryHotPost");
		this.saveAttribute("rows1", rows1);
	}

	
	
}
