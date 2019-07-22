package com.subcircle.web.kc.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.web.ControllerInterface;

public abstract class KcAbstractController implements ControllerInterface 
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
	 * ����kc02����ʾ�����������Ϣ
	 * @throws Exception
	 */
	
	protected final void ShowAnimebyRank()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
//		System.out.println(rows.size());
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û��������Ϣ��");
		}
	}
	
	
	/**
	 * ����kc03����ʾ�鼮��������Ϣ
	 * @throws Exception
	 */
	
	
	protected final void ShowBookbyRank() throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û��������Ϣ��");
		}
	}
	
	
	/**
	 * ����kc04����ʾ��Ϸ��������Ϣ
	 * @throws Exception
	 */
	
	protected final void ShowGamebyRank() throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û��������Ϣ��");
		}
	}
	
	/**
	 * ����kc02����ʾ��Ŀ��ϸ��Ϣ
	 * @throws Exception
	 */
	
	protected final void ShowAnimeDetail() throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		Map<String,String> ins = this.services.findById();
		List<Map<String, String>> rows=this.services.queryAnimeComment();
		Boolean b = this.services.collectionExsits();
		List<Map<String, String>> rows2 = this.services.queryAnimeTopic();

		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
			this.saveAttribute("rows",rows) ;
			this.saveAttribute("b", b);
			this.saveAttribute("rows2", rows2);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ������Ŀ�ѱ�ɾ�����ֹ���ʣ�");
		}
		
	}
	
	
	
	/**
	 * ����kc03����ʾ��Ŀ��ϸ��Ϣ
	 * @throws Exception
	 */
	protected final void ShowBookDetail() throws Exception
	{
		
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		Map<String,String> ins = this.services.findById();
		List<Map<String, String>> rows=this.services.queryAnimeComment();
		Boolean b = this.services.collectionExsits();
		List<Map<String, String>> rows2 = this.services.queryAnimeTopic();
		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
			this.saveAttribute("rows",rows) ;
			this.saveAttribute("b", b);
			this.saveAttribute("rows2", rows2);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ������Ŀ�ѱ�ɾ�����ֹ���ʣ�");
		}
		
	}
	

	/**
	 * ����kc04����ʾ��Ŀ��ϸ��Ϣ
	 * @throws Exception
	 */
	protected final void ShowGameDetail() throws Exception
	{
		
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		Map<String,String> ins = this.services.findById();
		List<Map<String, String>> rows=this.services.queryAnimeComment();
		Boolean b = this.services.collectionExsits();
		List<Map<String, String>> rows2 = this.services.queryAnimeTopic();
		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
			this.saveAttribute("rows",rows) ;
			this.saveAttribute("b", b);	
			this.saveAttribute("rows2", rows2);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ������Ŀ�ѱ�ɾ�����ֹ���ʣ�");
		}
		
	}
	
	
	/**
	 * ����kc02���û��������ֺ��ղ�
	 * @throws Exception
	 */
	
	protected final void AnimeRankAndComment() throws Exception
	{
		this.update("addAnimeComment", "");
		
	}
	
	
	
	/**
	 * ����kc02���޸����ֺ��ղ���Ϣ
	 * @throws Exception
	 */
	
	protected final void UpdateAnimeComment() throws Exception
	{
		
		this.update("updateAnimeComment", "");
	}
	
	
	/**
	 * ����kc02��ɾ���ղغ�����
	 * @throws Exception
	 */
	
	protected final void DelAnimeComment() throws Exception
	{
		
		this.update("delAnimeComment", "");
	}
	
	
	
	protected final void UpdateInfo() throws Exception
	
	{
		
		this.update("UpdateInfo", "");
	}
	
	protected final void UpdateInfoB() throws Exception
	
	{
		
		this.update("UpdateInfoB", "");
	}
	
	protected final void UpdateInfoG() throws Exception
	
	{
		
		this.update("UpdateInfoG", "");
	}
	/**
	 * ��ʾ��������ҳ��
	 * @throws Exception
	 */
	protected final void ShowAllComments() throws Exception
	{
		List<Map<String, String>> rows=this.services.queryAnimeCommentAll();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�����ۣ�");
		}
		
	}
	
	
	/**
	 * ��ѯ����
	 * @throws Exception
	 */
	protected final void SearchinAnime() throws Exception {
		List<Map<String, String>> rows=this.services.searchinAnime();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û��ƥ����Ϣ��");
		}
		
	}

	
}
