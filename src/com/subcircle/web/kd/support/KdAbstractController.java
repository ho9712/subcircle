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
	
	private List<Map<String, String>> executeQueryForList(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//���÷���Ȩ�ޣ�ʹ�ܹ�����private����
		method.setAccessible(true);
		return (List<Map<String, String>>)method.invoke(this.services);
	}
	
	private Map<String, Object> executeQueryForMap(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//���÷���Ȩ�ޣ�ʹ�ܹ�����private����
		method.setAccessible(true);
		return (Map<String, Object>)method.invoke(this.services);
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
			this.session.setAttribute("kkd102", user.get("kkd102"));
			this.session.setAttribute("kkd104", user.get("kkd104"));
			this.session.setAttribute("user", user);
			this.dto.put("username", user.get("kkd102"));
			if(user.get("kkd104").toString().equals("4") || user.get("kkd104").toString().equals("5"))
			{
				return this.userMain();
			}
			else
			{
				return this.adminMain();
			}
		}
	}
	
	//�����û���ҳ
	protected final String userMain()throws Exception
	{
		if(this.session.getAttribute("user")!=null)
		{
			this.dto.put("username", this.session.getAttribute("kkd102"));
			this.session.removeAttribute("msgs");
			List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
			this.session.setAttribute("msgs", msgs);
			if(this.dto.get("kkd101")==null)
			{
				this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			}
			Map<String,Object> colls=this.executeQueryForMap("queryMainColl");
			this.saveAttribute("colls", colls);
			List<Map<String, String>> posts=this.executeQueryForList("queryMainPost");
			this.saveAttribute("posts", posts);
			List<Map<String, String>> goods=this.executeQueryForList("queryMainShopRecord");
			this.saveAttribute("goods", goods);
			return "kd/userpage_main";
		}
		else
		{
			return "kd/nologin";
		}
	}
	
	//���ع���Ա��ҳ
	protected final String adminMain()throws Exception
	{
		if(this.session.getAttribute("user")!=null)
		{
			this.dto.put("username", this.session.getAttribute("kkd102"));
			this.session.removeAttribute("msgs");
			List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
			this.session.setAttribute("msgs", msgs);
			return "kd/adminpage_main";
		}
		else
		{
			return "kd/nologin";
		}
	}
	
	//�û��ǳ�
	protected void userLogout()throws Exception
	{
		this.session.removeAttribute("user");
		this.session.removeAttribute("kkd104");
		this.session.removeAttribute("kkd101");
		this.session.removeAttribute("msgs");
	}

	//�û��޸ĸ�����Ϣ
	protected final String modifyInfo()throws Exception
	{
		if(session.getAttribute("user")!=null)
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
		else
		{
			return "kd/nologin";
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
			this.setHint("�����ɹ�", "�Ѵ�����û�Ȩ�����룡");
		}
		else
		{
			this.setHint("����ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
		this.queryApp();
	}
	
	//�鿴������ҳ
	protected final void findOther()throws Exception
	{
		Map<String, String> other=this.services.findById();
		this.saveAttribute("other", other);
		Map<String,Object> colls=this.executeQueryForMap("queryMainColl");
		this.saveAttribute("colls", colls);
		List<Map<String, String>> posts=this.executeQueryForList("queryMainPost");
		this.saveAttribute("posts", posts);
	}
	
	//��ѯ�����û���Ϣ
	protected final void otherInfo()throws Exception
	{
		Map<String, String> other=this.services.findById();
		this.saveAttribute("other", other);
	}
	
	//������Ϣ
	protected final void sendMsg()throws Exception
	{
		if(this.dto.get("kkd204").toString().length()<21)
		{
			if(this.executeMethod("sendMsg"))
			{
				this.setHint("���ͳɹ�", "�����ѷ��������û����ȴ��Է��鿴��");
			}
			else
			{
				this.setHint("����ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
			}
		}
		else
		{
			this.setHint("����ʧ��", "��Ķ��ű��ⳬ����20�֣�");
		}
	}
	
	//��ѯ���н�����Ϣ
	protected final void queryReceive()throws Exception
	{
		this.dto.put("flag", "receive");
		List<Map<String, String>> receives=this.services.queryByCondition();
		this.saveAttribute("receives", receives);
	}
	
	//��ѯ���з��͵���Ϣ
	protected final void querySend()throws Exception
	{
		this.dto.put("flag", "send");
		List<Map<String, String>> sends=this.services.queryByCondition();
		this.saveAttribute("sends", sends);
	}
	
	//ɾ����Ϣ
	protected final String delMsg()throws Exception
	{
		if(this.dto.get("sign").toString().equals("sender"))
		{
			if(this.executeMethod("senderDelMsg"))
			{
				this.setHint("ɾ���ɹ�", "����Ϣ�ѱ�ɾ����");
			}
			else
			{
				this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
			}
			this.querySend();
			return "kd/message_to";
		}
		else
		{
			if(this.executeMethod("receiverDelMsg"))
			{
				this.setHint("ɾ���ɹ�", "����Ϣ�ѱ�ɾ����");
				//����Ϊ�Ѷ�
				this.executeMethod("readMsg");
				//���»�ȡδ����Ϣ
				this.session.removeAttribute("msgs");
				List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
				this.session.setAttribute("msgs", msgs);
			}
			else
			{
				this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
			}
			this.queryReceive();
			return "kd/message_receive";
		}
	}
	
	//�鿴������Ϣ����
	protected final void findMsgDetail()throws Exception
	{
		Map<String, Object> map=this.services.queryInMap();
		this.saveAttribute("map", map);
		if(this.dto.get("flag").toString().equals("receive"))
		{
			//����Ϊ�Ѷ�
			this.executeMethod("readMsg");
			//���»�ȡδ����Ϣ
			this.session.removeAttribute("msgs");
			List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
			this.session.setAttribute("msgs", msgs);
		}
	}
	
	//�ظ���Ϣ
	protected final void replyMsg()throws Exception
	{
		if(this.executeMethod("replyMsg"))
		{
			this.setHint("�ظ��ɹ�", "�ȴ��Է��鿴");
			Map<String, Object> map=this.services.queryInMap();
			this.saveAttribute("map", map);
		}
		else
		{
			this.setHint("�ظ�ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//����Ա��ѯ�ٱ�
	protected final String queryReport()throws Exception
	{
		List<Map<String, String>> reports=this.services.queryByCondition();
		this.saveAttribute("reports",reports);
		if(this.dto.get("flag").toString().equals("post"))
		{
			return "kd/forumadminpage_queryReportPost";
		}
		else
		{
			return "kd/forumadminpage_queryReportReply";
		}
	}
	
	//����Աɾ���ٱ�
	protected final String delReport()throws Exception
	{
		if(this.executeMethod("delReport"))
		{
			this.setHint("ɾ���ɹ�", "�þٱ��ѱ�ɾ����");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
		return this.queryReport();
	}
	
	//��ѯ�����ղ�
	protected final void queryAnimeColl()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		}
		List<Map<String, String>> animeColls=this.executeQueryForList("queryAnimeColl");
		this.saveAttribute("animeColls", animeColls);
	}
	
	//��ѯ�鼮�ղ�
	protected final void queryBookColl()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		}
		List<Map<String, String>> bookColls=this.executeQueryForList("queryBookColl");
		this.saveAttribute("bookColls", bookColls);
	}
	
	//��ѯ��Ϸ�ղ�
	protected final void queryGameColl()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		}
		List<Map<String, String>> gameColls=this.executeQueryForList("queryGameColl");
		this.saveAttribute("gameColls", gameColls);
	}
	
	//�޸���Ʒ����
	protected final void modifyComment()throws Exception
	{
		if(this.executeMethod("modifyComment"))
		{
			this.setHint("�޸ĳɹ�", "��Ը���Ʒ�������ѱ����£�");
		}
		else
		{
			this.setHint("�޸�ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//ɾ����Ʒ�ղؼ�����
	protected final void delColl()throws Exception
	{
		if(this.executeMethod("delColl"))
		{
			this.setHint("ɾ���ɹ�", "����Ʒ �Ѵ�����ղ����Ƴ���");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//��ѯ������¼
	protected final void queryPostRecord()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));	
		}
		List<Map<String, String>> posts=this.services.queryByCondition();
		this.saveAttribute("posts", posts);
	}
	
	//ɾ������
	protected final void delPost()throws Exception
	{
		if(this.executeMethod("delPost"))
		{
			this.setHint("ɾ���ɹ�", "�������ѱ�ɾ����");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//��ѯ������¼
	protected final void queryReplyRecord()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));	
		}
		List<Map<String, String>> replys=this.services.queryByCondition();
		this.saveAttribute("replys", replys);
	}
	
	//ɾ������
	protected final void delReply()throws Exception
	{
		if(this.executeMethod("delReply"))
		{
			this.setHint("ɾ���ɹ�", "�û����ѱ�ɾ����");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//��ѯ�����ղ�
	protected final void queryPostColl()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		List<Map<String, String>> postColls=this.services.queryByCondition();
		this.saveAttribute("postColls", postColls);
	}
	
	//ȡ�������ղ�
	protected final void delPostColl()throws Exception
	{
		if(this.executeMethod("delPostColl"))
		{
			this.setHint("ȡ���ɹ�", "�������Ѵ�����ղ����Ƴ���");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//��ѯ��Ʒ�����¼
	protected final void queryShopRecord()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		List<Map<String, String>> goods=this.services.queryByCondition();
		this.saveAttribute("goods", goods);
	}
	
	//ɾ����Ʒ�����¼
	protected final void delShopRecord()throws Exception
	{
		if(this.executeMethod("delShopRecord"))
		{
			this.setHint("ɾ���ɹ�", "�ü�¼�Ѵ���������¼���Ƴ���");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//ɾ��ѡ����Ʒ�����¼
	protected final void delSelect()throws Exception
	{
		if(this.executeMethod("delSelect"))
		{
			this.setHint("ɾ���ɹ�", "ѡ�м�¼�Ѵ���������¼���Ƴ���");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
	
	//��ѯ��Ʒ�ղؼ�¼
	protected final void queryShopColl()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		List<Map<String, String>> goods=this.services.queryByCondition();
		this.saveAttribute("goods", goods);
	}
	
	//ɾ����Ʒ�ղؼ�¼
	protected final void delShopColl()throws Exception
	{
		if(this.executeMethod("delShopColl"))
		{
			this.setHint("ɾ���ɹ�", "����Ʒ�Ѵ�����ղ����Ƴ���");
		}
		else
		{
			this.setHint("ɾ��ʧ��", "���������ܳ�����һ��С���⣬���Ժ����ԣ�");
		}
	}
}
