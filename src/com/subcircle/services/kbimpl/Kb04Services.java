package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb04Services extends JdbcServicesSupport 
{	
	
	@Override
	public Map<String, String> findById() throws Exception 
	{
		//��ѯ���ﳵ����ĳ�û��Ƿ����ĳ��Ʒ
		StringBuilder sql = new StringBuilder()
			.append(" select kkb101,kkd101,kkb402,kkb403")
			.append("   from kb04 ")
			.append("  where kkb101 = ? and kkd101 = ?")
			;
	
		Object args[] = 
			{
				this.get("kkb101"),
				"1" 	//�û�id���޸�
			};
		return this.queryForMap(sql.toString(),args);
	}
	
	/**
	 * 	��ѯ���ﳵ����ĳ�û��Ƿ����ĳ��Ʒid
	 * 	���ڵĻ����¸�����¼,�����ڵĻ������¼
	 * 	ά�ֹ��ﳵ����ĳһ�û�ID��ĳһ��ƷID����һ����¼
	 * @return
	 * @throws Exception
	 */
	private boolean addToMyCart() throws Exception
	{
//		//��ѯ���ﳵ����ĳ�û��Ƿ����ĳ��Ʒ
//		StringBuilder sql_1 = new StringBuilder()
//			.append(" select kkb101,kkd101,kkb402,kkb403")
//			.append("   from kb04 ")
//			.append("  where kkb101 = ? and kkd101 = ?")
//			;
//	
//		Object args_1[] = 
//			{
//				this.get("kkb101"),
//				"1" 	//�û�id���޸�
//			};
//		
		Map<String,String> ins = this.findById();
		
		StringBuilder sql_2 = new StringBuilder();
		//���ﳵ�д��ڸ��û����ڶԸ���Ʒ�ļ�¼,������Ŀ
		if (ins != null)
		{
			sql_2.append("update kb04 set kkb402 = kkb402 + ? where kkb101 = ? and kkd101 = ?");
		}
		else 
		{
			sql_2.append("insert into kb04(kkb402,kkb101,kkd101,kkb403)")
				 .append("		 values (?,?,?,current_timestamp)")
				 ;
		}
		
		Object args_2[] =
			{
				this.get("kkb402"),
				this.get("kkb101"),
				"1"		//�û�ID֮������
			};
		
		return this.executeUpdate(sql_2.toString(), args_2) > 0;
	}
	
	/**
	 *	 ��ʾ�û��Ĺ��ﳵ��Ϣ
	 *	
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		StringBuilder sql_1 = new StringBuilder()
				.append(" select k.kkb101,k.kkb402")
				.append("	from kb04 k")
				.append("  where k.kkd101 = ?")
				;
		Object args[] = 
		{
			"1" //�û�id���滻	
		};
		
		//��kb04����ȡ����Ʒid������
		List<Map<String, String>> rows = this.queryForList(sql_1.toString(),args);
		
		StringBuilder sql_2 = new StringBuilder()
				.append(" select k.kkb101,k.kkb102,k.kkb103,k.kkb105")
				.append("	from kb01 k")
				.append("  where k.kkb110 = 1")
				.append("  	 and k.kkb101 = ?")
				;
		
		//���巵������
		List<Map<String, String>> cartItems = new ArrayList<>();
		//ÿһ��cartItem����kkb101(ID),kkb102(��Ʒ��),kkb103(��Ʒ����),kkb105(����ͼ),kkb402(����)
		int initSize = (int)(5/0.75)+1;	
		for (Map<String, String> ins:rows)
		{
			Map<String,String> cartItem = new HashMap<>(initSize);
			cartItem = this.queryForMap(sql_2.toString(),ins.get("kkb101"));
			cartItem.put("kkb402",ins.get("kkb402"));
			cartItems.add(cartItem); 
		  }
	
		return cartItems;
	}
	
	/**
	 * 	���ݹ��ﳵ���û�id����Ʒidɾ�����ﳵ�и��û��Ը���Ʒ�ļ�¼
	 * @return
	 * @throws Exception
	 */
	private boolean deleteFromMyCart() throws Exception
	{
		String sql = "delete from kb04 where kkb101 = ? and kkd101 = ?";
		Object args[] = 
			{
				this.get("kkb101"),
				"1"			//�û�id���޸�
			};
		return this.executeUpdate(sql, args) > 0;
	}
	
	/**
	 * 	���¹��ﳵ��ĳһ��Ʒ����Ŀ
	 * @return
	 * @throws Exception
	 */
	private boolean updateMyCart() throws Exception
	{
		String sql="update kb04 set kkb402 = ? where kkb101 = ? and kkd101 = ?";
		Object args[] = 
			{
				this.get("kkb402"),
				this.get("kkb101"),
				"1"			//�û�id���޸�
			};
		return this.executeUpdate(sql, args) > 0;
	}
}
