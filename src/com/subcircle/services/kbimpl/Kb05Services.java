package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.Query;

import com.subcircle.services.support.JdbcServicesSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

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
		Object idlist[] = this.getIdlist("idlist");
		List<Map<String, String>> rows = new ArrayList<>();
		Map<String, String> ins = null;
		int initSize = (int)(5/0.75)+1;
		if(idlist.length > 0) 
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

	/**
	 *	 Ϊ�û�ѡ�е�ÿһ����Ʒ����һ������
	 * @return
	 * @throws Exception
	 */
	private boolean createOrder() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into kb05(kkb101,kkd101,kkb502,kkb503,kkb504,kkb505)")
				.append("		 values (?,?,?,current_timestamp,?,?)")
				;
			
		List<Map<String, String>> rows = this.findSelectItemsInfo();
		for(Map<String, String > ins: rows) 
		{
			Object args[]= 
				{
					ins.get("kkb101"),
					"1",	//�û�id���޸�
					"0",	//����״̬,0��ʾ��֧��
			        ins.get("kkb402"),
			        ins.get("kkb103")
				};
			 this.appendSql(sql.toString(), args);
		}
		
		 return this.executeTransaction();
	}
	
	
	/**
	 *	��ѯ���û�����״̬�Ķ��� 
	 */
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb504,k5.kkb505")
			.append("    from kb01 k1, kb05 k5")
			.append("	where k5.kkd101 = ?")
			.append("     and k1.kkb101 = k5.kkb101")
			;
		
		Object args[] = 
			{
				"1"		//�û�id���޸�	
			};
		return this.queryForList(sql.toString(), args);
	}
	
	
	/**
	 * 	��ѯ���û���ĳһ״̬�Ķ���
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderByState(String userId,String tag) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb504,k5.kkb505")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?  and k5.kkb502 = ?")
				.append("     and k1.kkb101 = k5.kkb101")
				;
		
		Object args[] = 
			{
				userId,
				tag
			};
		return this.queryForList(sql.toString(), args);
		
	}
	

	/**
	 * 	��ѯ���û���ͬ״̬�Ķ������ڲ�ͬ��List������objMap����
	 * 
	 */
	@Override
	public Map<String, Object> queryInMap() throws Exception 
	{
		Map<String, Object> objMap = new HashMap<>();
		String userId = "1"; //�û�Id���޸�
		List<Map<String, String>> orderToPay = queryOrderByState(userId, "0");
		objMap.put("orderTopay",orderToPay);
		
		return objMap;
	}
	
	
	private boolean deleteOrderToPay() throws Exception
	{
		String sql = "delete from kb05 where kkd101 = ? and kkb502 = 0";
		Object args[] = 
			{
				"1"   		//�û�id���޸�
			};
		return this.executeUpdate(sql, args) > 0;
	}
	
}
