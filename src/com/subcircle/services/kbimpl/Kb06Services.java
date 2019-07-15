package com.subcircle.services.kbimpl;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb06Services extends JdbcServicesSupport 
{
	/**
	 * 	�û����۶���
	 * @return
	 * @throws Exception
	 */
	private boolean createRate() throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append(" insert into kb06(kkb501,kkd101,kkb602,kkb603,kkb604,kkb605)")
			.append("		   values     (?,?,?,?,current_timestamp,?)")
			;
		
		//ǰ��ҳ�洫������Ӧ
		Object kkb501List[] = this.getIdlist("kkb501List");	//������ˮ��
		Object kkb101List[] = this.getIdlist("kkb101List");	//��Ʒid
		Object kkb602List[] = this.getIdlist("kkb602");		//��������
		Object kkb603List[] = this.getIdlist("kkb603");		//��������
		
		for(int i = 0; i < kkb501List.length;i++) 
		{
			Object args[] = 
				{
					kkb501List[i],
					this.get("kkd101"),		//�û�id
					kkb602List[i],
					kkb603List[i],
					kkb101List[i]
				};
			
			this.appendSql(sql.toString(), args);
		}
		
		return this.executeTransaction();
	} 
	
	/**
	 * �û������궩�����޸Ķ���״̬Ϊ������
	 * @return
	 * @throws Exception
	 */
	private boolean updateKkb508()throws Exception 
	{
		StringBuilder sql = new StringBuilder()
			.append("	update kb05 ")
			.append("	   set kkb508 = ?")
			.append("	 where kkd101 = ? and kkb507 = ?")
			;
		
		Object args[] = 
			{
				"1",		//�Ƿ����۵ı�ʶ--1��ʾ������
				this.get("kkd101"),		//�û�id
				this.get("kkb507")
			};
		
		return this.executeUpdate(sql.toString(), args) > 0;
	}
	
	/**
	 * 	����ĳһ��Ʒ������
	 * @param itemId
	 * @return
	 * @throws Exception
	 */
	public String getScoreById(String itemId) throws Exception 
	{
		String sql = "select avg(kkb602) as kkb602 from kb06  where kkb605 = ?";
		Object args[] = 
			{
				itemId	
			};
		return this.queryForMap(sql, args).get("kkb602");
	}
}
