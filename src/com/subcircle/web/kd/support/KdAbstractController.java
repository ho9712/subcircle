package com.subcircle.web.kd.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.system.tools.Tools;
import com.subcircle.web.ControllerInterface;

public abstract class KdAbstractController implements ControllerInterface 
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

	//�û�ע��
	protected final void userSignUp()throws Exception
	{
		if(this.dto.get("kkd102").toString().length()<6 || this.dto.get("kkd102").toString().length()>12)
		{
			this.saveAttribute("usernameError", "��ȷ������û���������6-12λ֮�䣡");
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.saveAttribute("passwordError", "��ȷ��������볤����6-16λ֮�䣡");
		}
		else if(!this.dto.get("kkd103").equals(this.dto.get("kkd103-1")))
		{
			this.saveAttribute("checkPwdError", "��ȷ����������������뱣��һ�£�");
		}
		else
		{
			if(this.executeMethod("userSignUp"))
			{
				this.saveAttribute("msg", "ע��ɹ���");
			}
			else
			{
				this.saveAttribute("usernameError", "���û����ѱ�ʹ�ã��뻻һ�����ԣ�");
			}
		}
	}

	//�û���¼
	protected String userLogin()throws Exception
	{
		Map<String, String> user=services.findById();
		if(user==null)
		{
			this.saveAttribute("usernameError", "���˺Ų����ڣ�");
			return "kd/login";
		}
		else if(!user.get("kkd103").equals(Tools.getMd5(dto.get("kkd103"))))
		{
			this.saveAttribute("error", "��ȷ������û�����������ȷ��");
			return "kd/login";
		}
		else
		{
			user.remove("kkd103");
			this.session.setAttribute("kkd101", user.get("kkd101"));
			this.session.setAttribute("kkd104", user.get("kkd104"));
			this.session.setAttribute("user", user);
			if(user.get("kkd104").toString().equals("0"))
			{
				return "kd/rootadminpage_main";
			}
			else if(user.get("kkd104").toString().equals("4") || user.get("kkd104").toString().equals("5"))
			{
				return "kd/userpage_main";
			}
			else
			{
				return "kd/login";
			}
		}
	}
	
	//�û��ǳ�
	protected void userLogout()throws Exception
	{
		this.session.removeAttribute("user");
		this.session.removeAttribute("kkd104");
		this.session.removeAttribute("kkd101");
	}
//	protected final void findById()throws Exception
//	{
//		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
//		Map<String, String> user=this.services.findById();
//		this.saveAttribute("user", user);
//	}
	//�û��޸ĸ�����Ϣ
	protected final void modifyInfo()throws Exception
	{
		if(this.executeMethod("modifyInfo"))
		{
			this.saveAttribute("msg", "�޸ĳɹ�");
			Map<String, String> user=services.findById();
			user.remove("kkd103");
			this.session.removeAttribute("user");
			this.session.setAttribute("user", user);
		}
		else
		{
			this.saveAttribute("msg", "�޸�ʧ�ܣ����Ժ�����");
		}
	}
	
	//�û��޸�����
	protected final void modifyPwd()throws Exception
	{
		if(!this.dto.get("kkd103").toString().equals(this.dto.get("kkd103-check")))
		{
			this.saveAttribute("msg", "�������벻һ�£�");
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.saveAttribute("msg", "��ȷ��������볤����6-16λ֮�䣡");
		}
		else
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			if(this.executeMethod("modifyPwd"))
			{
				this.saveAttribute("msg", "�����޸ĳɹ���");
			}
			else
			{
				this.saveAttribute("msg", "���ڵ����벻��ȷ");
			}
		}
	}
	
	//��ѯ���й���Ա�˺�
	protected final void queryAdmin()throws Exception
	{
		List<Map<String, String>> admins=this.services.queryByCondition();
		this.saveAttribute("admins", admins);
	}
}
