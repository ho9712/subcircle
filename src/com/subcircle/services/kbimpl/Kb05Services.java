package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb05Services extends JdbcServicesSupport 
{

	/**
	 * 	��ѯ���ﳵ��ѡ����Ʒ�ľ�����Ϣ
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> findSelectItemsInfo() throws Exception
	{
		//��ѯ��ѡ�е���Ʒ����ƷID,��Ʒ��,��Ʒ����,��Ʒ����ͼ,��Ʒ��Ŀ
		StringBuilder sql = new StringBuilder()
			.append(" select k1.kkb101,k1.kkb102, k1.kkb103,k1.kkb105,k4.kkb402")
			.append("   from kb01 k1,kb04 k4")
			.append("  where k1.kkb101 = k4.kkb101 and k1.kkb101 = ?")
			;
		
		Object idlist[] = null;
		//getIdlist�÷������ص�size����Ϊ1(�ӹ��ﳵҳ�洫����)
		if(this.getIdlist("idlist")[0] != null) 
		{
			idlist = this.getIdlist("idlist");
		}
		List<Map<String, String>> rows = new ArrayList<>();
		Map<String, String> ins = null;
		int initSize = (int)(5/0.75)+1;
		if(idlist != null && idlist.length > 0) 
		{
			for(Object kkb101 : idlist) 
			{
				ins = new HashMap<>(initSize);
				ins = this.queryForMap(sql.toString(), kkb101);
				rows.add(ins);
			}
		}
		return rows;
	}
	
	//���񶩵�����,�����������ʱ��ѯ����ѡ��Ʒ����Ϣ
	private Map<String, String> findSelectItemInfo() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" select k1.kkb101,k1.kkb102, k1.kkb103,k1.kkb105")
				.append("   from kb01 k1")
				.append("  where k1.kkb101 = ?")
				;
		return this.queryForMap(sql.toString(), this.get("kkb101"));
	}

	/**
	 *	 Ϊ�û�ѡ�е�ÿһ����Ʒ����һ������
	 * @return
	 * @throws Exception
	 */
	private boolean createOrder() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into kb05(kkb101,kkd101,kkb502,kkb503,kkb504,")
				.append("                 kkb505,kkb506,kkb507)")
				.append("		 values (?,?,?,current_timestamp,?,")
				.append("                ?,?,?)")
				;

		//�����������ť�������������
		if (this.get("kkb101") != null)
		{
			Object args[]= 
				{
					this.get("kkb101"),
					"1",	//�û�id���޸�
					"0",	//����״̬,0��ʾ��֧��
			        this.get("kkb504"),	//��Ʒ����
			        this.get("kkb505"),	//��Ʒ����
			        this.get("kkb506"),	//������ע����ҳ����������ť�Ż��ڶ�������ʱ��ֵ��
			        this.get("kkb507")	//�̻�������
				};
			this.appendSql(sql.toString(), args);
		}
		//�ӹ��ﳵ��ѡ����Ʒ��������
		else
		{
			List<Map<String, String>> rows = this.findSelectItemsInfo();

			if (rows.size() > 0) 
			{
				for(Map<String, String > ins: rows) 
				{
					Object args[]= 
						{
							ins.get("kkb101"),
							"1",	//�û�id���޸�
							"0",	//����״̬,0��ʾ��֧��
					        ins.get("kkb402"),
					        ins.get("kkb103"),
					        this.get("kkb506"),	//������ע����������Ż��ڶ�������ʱ��ֵ��
					        this.get("kkb507")	//�̻�������
						};
					 this.appendSql(sql.toString(), args);
				}
			}

		}
		 return this.executeTransaction();
	}
	
	
	/**
	 *	�����û����µĴ�֧������
	 *	�ӹ��ﳵ��ת��֧��ҳ��ֻ��ʾ��ǰ����
	 */
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		String userId = "1"; //�û�Id���޸�
		List<Map<String, String>> orderToPay = queryOrderByState(userId, "0",(String)this.get("kkb507"));
		return orderToPay;
	}
	
	
	/**
	 * 	��ѯ���û���ĳһ״̬�����ж�����
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderNumByState(String userId,String state) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k5.kkb507")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?  and k5.kkb502 = ?")
				.append("     and k1.kkb101 = k5.kkb101")
				;
		
		Object args[] = 
			{
				userId,
				state
			};
		return this.queryForList(sql.toString(), args);
		
	}
	
	
	/**
	 * 	��ѯ���û���ĳһ״̬��ĳһ�����Ŷ�Ӧ�����ж�����¼
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderByState(String userId,String state,String kkb507) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb504,k5.kkb505,k5.kkb506,k5.kkb507")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?  and k5.kkb502 = ?")
				.append("     and k1.kkb101 = k5.kkb101")
				.append("     and k5.kkb507 = ?")
				;
		
		Object args[] = 
			{
				userId,
				state,
				kkb507
			};
		return this.queryForList(sql.toString(), args);
		
	}

	

	/**
	 * 	��ѯ���û���ͬ״̬�Ķ���
	 * 	����List������objMap����
	 */
	@Override
	public Map<String, Object> queryInMap() throws Exception 
	{
		Map<String, Object> objMap = new HashMap<>();
		String userId = "1"; //�û�Id���޸�
		//��ѯ��ĳһ״̬�µĶ��������еĶ�����
		List<Map<String, String>> orderNumber = queryOrderNumByState(userId,(String)this.get("kkb502"));
		
		//LinkedHashMap��������˳��
		Map<String, String> dealOrderNumber = new LinkedHashMap<>();
		
		//ÿһ�������ű���һ��
		for(Map<String, String> tempMap : orderNumber) 
		{
			String kkb507 = tempMap.get("kkb507");
			dealOrderNumber.put(kkb507, kkb507);
		}
		
		
		//ÿһ���������µ����м�¼��װ��һ��List<Map<String, String>>��
		int i = 0;
		for (String temp: dealOrderNumber.keySet()) 
		{
			i++;
			objMap.put("order"+i,queryOrderByState(userId,(String)this.get("kkb502"),temp));
		}		
		return objMap;
	
	}
	
	@Override
	public List<Object> queryInList() throws Exception 
	{
		List<Object> objList = new ArrayList<>();
		String userId = "1"; //�û�Id���޸�
		//��ѯ��ĳһ״̬�µĶ��������еĶ�����
		List<Map<String, String>> orderNumber = queryOrderNumByState(userId,(String)this.get("kkb502"));
		
		//LinkedHashMap��������˳��
		Map<String, String> dealOrderNumber = new LinkedHashMap<>();
		
		//ÿһ�������ű���һ��
		for(Map<String, String> tempMap : orderNumber) 
		{
			String kkb507 = tempMap.get("kkb507");
			dealOrderNumber.put(kkb507, kkb507);
		}
		
		
		//ÿһ���������µ����м�¼��װ��һ��List<Map<String, String>>��
		for (String temp: dealOrderNumber.keySet()) 
		{
			objList.add(queryOrderByState(userId,(String)this.get("kkb502"),temp));
		}		
		return objList;
	}
	
	
	/**
	 * 	�����̻�������ɾ���û���֧������
	 * @return
	 * @throws Exception
	 */
	private boolean deleteOrderToPay() throws Exception
	{
		String sql = "delete from kb05 where kkd101 = ? and kkb502 = 0 and kkb507 = ?";
		Object args[] = 
			{
				"1",   		//�û�id���޸�
				this.get("kkb507")
			};
		return this.executeUpdate(sql, args) > 0;
	}
	
	
	/**
	 * 	�����û�id���̻������Ÿı䶩����״̬
	 * @return
	 * @throws Exception
	 */
	//	��paySuccessServletʹ��
	//(�ƿ����Ŀ������Ĳ����޷���ȡdtoͨ���������ݽ��,����Ȩ����Ϊpublic)
	public boolean updateOrderState(String state,String kkb507,String kkd101) throws Exception
	{
		String sql = "update kb05 set kkb502 = ? where kkb507 =  ? and kkd101 = ?";
		Object args[] = 
			{
				state,		//�����ı���״̬
				kkb507,		//�̻�������
				kkd101 		//�û�ID
			};
		
		return this.executeUpdate(sql, args) >0;
	}
	
	
	//��Kb05UpdateOrderServletʹ��
	private boolean UpdateOrderState() throws Exception
	{
		String state = (String)this.get("kkb502");		//�����ı���״̬
		String num = (String)this.get("kkb507");		//�̻�������
		String userID = "1"; 							//�û�ID���޸�
		return updateOrderState(state,num,userID);
	}
	
}
