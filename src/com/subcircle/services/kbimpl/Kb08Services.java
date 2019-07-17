package com.subcircle.services.kbimpl;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb08Services extends JdbcServicesSupport 
{
	private boolean addResponse() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into kb08(kkb701,kkd101,kkb802)")
				.append("     values     (?,?,?)")
				;
		Object args[]= 
			{
				this.get("kkb701"),
				this.get("kkd101"),		//响应者自身的id
				"1",				//响应求购状态
			};
		return this.executeUpdate(sql.toString(), args) > 0;
	} 
}
