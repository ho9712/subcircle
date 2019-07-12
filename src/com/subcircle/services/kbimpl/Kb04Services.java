package com.subcircle.services.kbimpl;

import java.util.List;
import java.util.Map;

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
		//��ѯ���ﳵ���Ƿ���ڸ���Ʒ
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
		
		StringBuilder sql = new StringBuilder()
			.append(" select k4.kkb101,k4.kkb402,k1.kkb102,k1.kkb103,k1.kkb105")
			.append("   from kb04 k4,kb01 k1")
			.append("  where k4.kkd101 = ? ")
			.append(" 	 and k4.kkb101 = k1.kkb101 ")
			.append(" 	 and k1.kkb110 = 1")
			;
		
		Object args[] = 
		{
			"1" //�û�id���滻	
		};
		return  this.queryForList(sql.toString(), args);
	}
	
	/**
	 * 	���ݹ��ﳵ���û�id����Ʒidɾ�����ﳵ�и��û��Ը���Ʒ�ļ�¼
	 * @return
	 * @throws Exception
	 */
	private boolean deleteFromMyCart() throws Exception
	{
		String sql = "delete from  kb04 where kkb101 = ? and kkd101 = ?";
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
	
	/**
	 *	����ɹ�������̻�������ɾ�����û����ﳵ�ж�Ӧ����Ʒ 
	 * @param kkb507
	 */
	//(�ƿ����Ŀ������Ĳ����޷���ȡdtoͨ���������ݽ��,����Ȩ����Ϊpublic)
	public boolean deleteCartItemsAfterPay(String kkb507,String userID)throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append(" delete ")
			.append("	  from kb04")
			.append("  where kkb101 in ")
			.append("		  	(select k5.kkb101 ")
			.append("					 from kb05 k5 ")
			.append("					where k5.kkb507 = ?)")
			.append("    and kkd101 = ? ")
			;
		
		Object args[] = 
			{
				kkb507,		//�̻�������
				userID  		//�û�id���޸�
			};
		return this.executeUpdate(sql.toString(), args)  > 0;
	}
}
