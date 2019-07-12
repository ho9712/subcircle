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

	//��Ϣ��ʾ
	private void setHint(String hint,String msg)
	{
		this.saveAttribute("hint", hint);
		this.saveAttribute("msg", msg);
	}
	
	//�û�ע��
	protected final void userSignUp()throws Exception
	{
		if(this.dto.get("kkd102").toString().length()<6 || this.dto.get("kkd102").toString().length()>12)
		{
			this.setHint("ʧ��", "��ȷ������û���������6-12λ֮�䣡");
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.setHint("ʧ��", "��ȷ��������볤����6-16λ֮�䣡");
		}
		else if(!this.dto.get("kkd103").equals(this.dto.get("kkd103-1")))
		{
			this.setHint("ʧ��", "��ȷ����������������뱣��һ�£�");
		}
		else
		{
			if(this.executeMethod("userSignUp"))
			{
				this.setHint("�ɹ�", "ע��ɹ���");
			}
			else
			{
				this.setHint("ʧ��", "���û����ѱ�ʹ�ã��뻻һ�����ԣ�");
			}
		}
	}

	//�û���¼
	protected String userLogin()throws Exception
	{
		Map<String, String> user=services.findById();
		if(user==null)
		{
			this.setHint("��¼ʧ��", "���˺Ų����ڣ�");
			return "kd/login";
		}
		else if(!user.get("kkd103").equals(Tools.getMd5(dto.get("kkd103"))))
		{
			this.setHint("��¼ʧ��", "��ȷ������û�����������ȷ��");
			return "kd/login";
		}
		else
		{
			user.remove("kkd103");
			this.session.setAttribute("kkd101", user.get("kkd101"));
			this.session.setAttribute("kkd104", user.get("kkd104"));
			this.session.setAttribute("user", user);
			if(user.get("kkd104").toString().equals("4") || user.get("kkd104").toString().equals("5"))
			{
				return "kd/userpage_main";
			}
			else
			{
				return "kd/adminpage_main";
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

	//�û��޸ĸ�����Ϣ
	protected final String modifyInfo()throws Exception
	{
		if(this.executeMethod("modifyInfo"))
		{
			this.setHint("�ɹ�", "������Ϣ�޸ĳɹ���");
			Map<String, String> user=services.findById();
			user.remove("kkd103");
			this.session.removeAttribute("user");
			this.session.setAttribute("user", user);
		}
		else
		{
			this.setHint("ʧ��", "�޸�ʧ�ܣ����Ժ����ԣ�");
		}
		if("45".contains(this.session.getAttribute("kkd104").toString()))
		{
			return "kd/userpage_info";
		}
		else
		{
			return "kd/adminpage_info";
		}
	}
	
	//�û��޸�����
	protected final String modifyPwd()throws Exception
	{
		if(!this.dto.get("kkd103").toString().equals(this.dto.get("kkd103-check")))
		{
			this.setHint("ʧ��", "������������벻һ�£�");
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.setHint("ʧ��", "��ȷ��������볤����6-16λ֮�䣡");
		}
		else
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			if(this.executeMethod("modifyPwd"))
			{
				this.setHint("�ɹ�", "�����޸ĳɹ���");
			}
			else
			{
				this.setHint("ʧ��", "ԭ�������벻��ȷ��");
			}
		}
		if("45".contains(this.session.getAttribute("kkd104").toString()))
		{
			return "kd/userpage_pwd";
		}
		else
		{
			return "kd/adminpage_pwd";
		}
	}
	
	//��ѯ���й���Ա�˺�
	protected final void queryAdmin()throws Exception
	{
		List<Map<String, String>> admins=this.services.queryByCondition();
		this.saveAttribute("admins", admins);
	}
	
	//��ӹ���Ա�˺�
	protected final void addAdmin()throws Exception
	{
		if(this.executeMethod("addAdmin"))
		{
			this.setHint("�����ɹ�", "�ɹ������һ������Ա�˺ţ�");
		}
		else
		{
			this.setHint("����ʧ��", "���û����ѱ�ʹ�á�");
		}
	}
	
	//����ĳ������Ա��Ϣ
	protected final void findAdmin()throws Exception
	{
		Map<String, String> admin=this.services.findById();
		this.saveAttribute("admin", admin);
	}
	
	//ɾ������Ա�˺�
	protected final void delAdmin()throws Exception
	{
		if(this.executeMethod("delAdmin"))
		{
			this.setHint("�����ɹ�", "�ù���Ա�˺��ѱ�ɾ����");
		}
		else
		{
			this.setHint("����ʧ��", "���������ܳ���һ��С���⣬���Ժ����ԣ�");
		}
		this.queryAdmin();
	}
	
	//�޸Ĺ���Ա��Ϣ
	protected final void modifyAdmin()throws Exception
	{
		if(this.executeMethod("modifyAdmin"))
		{
			if(this.dto.get("flag").toString().equals("1"))
			{
				this.setHint("���³ɹ�",	"�ù���Ա�������ѱ��޸ģ�");
			}
			else
			{
				this.setHint("���³ɹ�",	"�ù���Ա��Ȩ���ѱ��޸ģ�");
			}
		}
		else
		{
			this.setHint("����ʧ��", "���������ܳ���һ��С���⣬���Ժ����ԣ�");
		}
		this.queryAdmin();
	}
	
	//��ѯ�Լ�������
	protected final void findApp()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		Map<String, String> app=this.services.findById();
		this.saveAttribute("app", app);
	}
	
	//�û�����Ȩ��
	protected final void commitApp()throws Exception
	{
		if(this.dto.get("kkd302").toString().length()<21)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			if(this.executeMethod("commitApp"))
			{
				this.setHint("�����ύ�ɹ�",	"��ȴ�����Ա�Ĵ���");
			}
			else
			{
				this.setHint("�����ύʧ��", "���������ܳ���һ��С���⣬���Ժ����ԣ�");
			}
			this.findApp();
		}
		else
		{
			this.setHint("�����ύʧ��",	"������������20�֣�");
		}
	}
	
	//��ѯ����Ȩ���û�
	protected final void queryUser()throws Exception
	{
		this.dto.put("qkkd104", "4");
		List<Map<String, String>> users=this.services.queryByCondition();
		this.saveAttribute("users", users);
	}
	
	//�޸��û�Ȩ��
	protected final void revokePermission()throws Exception
	{
		if(this.executeMethod("revokePermission"))
		{
			this.setHint("�����ɹ�", "���û�Ȩ���ѱ�������");	
		}
		else
		{
			this.setHint("����ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
		this.queryUser();
	}
	
	//��ѯ�û�Ȩ������
	protected final void queryApp()throws Exception
	{
		List<Map<String, String>> apps=this.services.queryByCondition();
		this.saveAttribute("apps", apps);
	}
	
	//ɾ���û�Ȩ������
	protected final void delApp()throws Exception
	{
		if(this.executeMethod("delApp"))
		{
			this.setHint("�����ɹ�", "��ɾ����Ȩ�����룡");
		}
		else
		{
			this.setHint("����ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
		this.queryApp();
	}
	
	//�����û�Ȩ������
	protected final void dealApp()throws Exception
	{
		if(this.executeMethod("dealApp"))
		{
			this.setHint("�����ɹ�", "�Ѵ�����û�Ȩ�ޣ�");
		}
		else
		{
			this.setHint("����ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
		this.queryApp();
	}
	
}
