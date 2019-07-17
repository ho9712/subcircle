package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb07Services extends JdbcServicesSupport 
{
	/**
	 * 用户发布求购信息
	 * @return
	 * @throws Exception
	 */
	private boolean addInquiry() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" insert into kb07(kkd101,kkb702,kkb703,kkb704, kkb705,")
				.append("		  		   kkb706,kkb707,kkb708,kkb709)")
				.append("	   values     (?,?,?,?,?,")
				.append("				   ?,?,?,?)")
				;
		Object args[] = 
			{
				this.get("kkd101"),
				this.get("kkb702"),
				this.get("kkb703"),
				this.get("kkb704"),
				this.get("kkb705"),
				
				this.get("kkb706"),
				this.get("kkb707"),
				"1",						//表示求购信息待管理员审核
				this.get("kkb709")
			};
		return this.executeUpdate(sql.toString(), args) > 0;
	}
	
	
	/**
	 * 根据求购信息列表的状态查询求购信息列表
	 */
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append(" select k7.kkd101,k7.kkb701,k7.kkb702,k7.kkb703,k7.kkb704,")
				.append("		 k7.kkb705,k7.kkb706,k7.kkb707,k7.kkb708,k7.kkb709,")
				.append("        kd1.kkd105,kd1.kkd108,kd1.kkd102")
				.append("	from kb07 k7,kd01 kd1 ")
				.append("  where k7.kkb708 = ?")
				.append("    and k7.kkd101 = kd1.kkd101")
				; 
		
		Object args [] = 
			{
				this.get("kkb708"),		
			};
		
		List<Map<String, String>> temp =  this.queryForList(sql.toString(), args);
		List<Map<String, String>> result = new ArrayList<>();
		String sql_1 = "select count(*) as resCount from kb08 where kkb701 = ?";
		for (Map<String, String> map : temp)
		{
			map.put("resCount", this.queryForMap(sql_1, map.get("kkb701")).get("resCount"));
			result.add(map);
		}
		return result;
	}
	
	/**
	 * 更新求购信息的状态
	 * @return
	 * @throws Exception
	 */
	private boolean updateInquiryState() throws Exception
	{
		String sql = "update kb07 set kkb708 = ? where kkb701 = ?";
		Object args[] = 
			{
				this.get("kkb708"),
				this.get("kkb701")
			};
		boolean flag = this.executeUpdate(sql, args) > 0;
		if (flag) 
		{
			String kkd204 = "求购审核通知";
			String kkd205 = "您发布的求购已经通过审核";
			sendMsg(kkd204, kkd205);
		}
		return flag;
	}
	
	/**
	 * 发送消息
	 * @param kkd204
	 * @param kkd205
	 * @throws Exception
	 */
	private void sendMsg(String kkd204,String kkd205)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("insert into kd02(kkd202,kkd203,kkd204,kkd205,kkd206,kkd207,kkd208,kkd209)")
				.append("     values (?,?,?,?,?,current_timestamp,'0','0')")
				;
		Object[] args={
			this.get("kkd202"),	
			this.get("kkd203"),
			kkd204,			//管理员发送消息给求购用户标题
			kkd205,			//内容
			"0"
		};
		this.executeUpdate(sql.toString(), args);
	}

	
	private boolean delInquiryAndSendMsg() throws Exception
	{
		String sql = "delete from kb07 where kkb701 = ?";
		Object args[] = 
			{
				this.get("kkb701")
			};
		boolean flag = this.executeUpdate(sql, args) > 0;
		if (flag) 
		{
			String kkd204 = null;
			String kkd205 = null;
			//表示求购被管理员驳回
			if (this.get("kbflag").equals("1"))
			{
				kkd204 = "求购审核通知";
				kkd205 = "您的求购被管理员驳回";
			}
			//表示通过审核的求购被管理员撤销
			else if (this.get("kbflag").equals("2")) 
			{
				kkd204 = "求购信息通知";
				kkd205 = "您的求购被管理员撤销";
			}
			
			sendMsg(kkd204, kkd205);
		}
		return flag;
	}
}
