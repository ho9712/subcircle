package com.subcircle.services.kbimpl;

import java.util.Map;

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
		String sql = "select kkb301 from kb03 where kkd101 = ? and kkb101 = ?";
		Object args[] =
			{
				this.get("kkd101"),		//用户ID
				this.get("kkb101")		
			};
		Map<String, String> teMap =  this.queryForMap(sql, args);
		if (teMap != null && teMap.size() > 0)
		{
			return false;
		}
		else 
		{
			StringBuilder sql_1 = new StringBuilder()
					.append("insert into kb03(kkd101,kkb101,kkb302)")
					.append("		 values (?,?,current_timestamp)")
					;
			return this.executeUpdate(sql_1.toString(), args) > 0;
		}
	}
}
