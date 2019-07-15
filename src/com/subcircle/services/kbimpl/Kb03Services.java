package com.subcircle.services.kbimpl;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb03Services extends JdbcServicesSupport 
{
	
	
	/**
	 * 生成当前登入用户的收藏记录
	 * @return
	 * @throws Exception
	 */
	private boolean insertCollection() throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append("insert into kb03(kkb101,kkd101,kkb302)")
			.append("		 values (?,?,current_timestamp)")
			;
		Object args[] =
		{
			this.get("kkb101"),
			this.get("kkd101")		//用户ID
		};
		return this.executeUpdate(sql.toString(), args) > 0;
	}
}
