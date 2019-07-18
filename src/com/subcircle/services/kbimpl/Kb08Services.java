package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class Kb08Services extends JdbcServicesSupport 
{
	/**
	 * 添加响应列表
	 * @return
	 * @throws Exception
	 */
	private boolean addResponse() throws Exception
	{
		Map<String, String> teMap = isAdded((String)this.get("kkd101"),(String)this.get("kkb701"),"1");
		//该用户已经响应过该请求
		if (teMap != null)
		{
			return false;
		}
		else
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
	
	/**
	 * 用于辅助判断该用户是否响应过该求购
	 * @param kkd101
	 * @param kkb701
	 * @param kkb802
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> isAdded(String kkd101,String kkb701,String kkb802) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select k8.kkb801,k8.kkb701,k8.kkd101,k8.kkb802")
				.append("  from kb08 k8")
				.append(" where k8.kkd101 = ?")
				.append("   and k8.kkb701 = ?")
				.append("   and k8.kkb802 = ?")
				;
			Object args[] = 
				{
					kkd101,
					kkb701,
					kkb802
				};
			return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * 	根据用户id和响应状态查询响应列表
	 * 	如:用户a查询他被求购者拒绝的响应列表(kkb802 = 2)	
	 * @param kkd101
	 * @param kkb802
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryByUser(String kkd101,String kkb802)throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("     select k7.kkd101,k7.kkb701,k7.kkb702,k7.kkb703,k7.kkb704,")
				.append("		     k7.kkb705,k7.kkb706,k7.kkb707,k7.kkb708,k7.kkb709,")
				.append("	 	     kd1.kkd105,kd1.kkd108,kd1.kkd102,k8.kkb801,k8.kkb802")
				.append("		from kb07 k7,kd01 kd1,kb08 k8")
				.append("	   where k7.kkd101 =  kd1.kkd101")
				.append("	  	 and k7.kkb701 = k8.kkb701")
				.append("		 and k8.kkd101 = ?")
				.append("		 and k8.kkb802 = ?")
				;
		Object args[] = 
			{
				kkd101,		//响应者的用户Id
				kkb802
			};
		
		List<Map<String, String>> temp =  this.queryForList(sql.toString(), args);
		List<Map<String, String>> result = new ArrayList<>();
		String sql_1 = "select count(*) as resCount from kb08 where kkb701 = ? and kkb802 != 2";
		for (Map<String, String> map : temp)
		{
			map.put("resCount", this.queryForMap(sql_1, map.get("kkb701")).get("resCount"));
			result.add(map);
		}
		return result;
	}
	
	/**
	 * 	返回用户的响应列表清单
	 */
	@Override
	public List<Object> queryInList() throws Exception 
	{
		List<Object> objList = new ArrayList<>();
		String kkd101 = (String) this.get("kkd101");
		List<Map<String, String>> UserResponse_1 = this.queryByUser(kkd101, "1");
		List<Map<String, String>> UserResponse_2 = this.queryByUser(kkd101, "2");
		List<Map<String, String>> UserResponse_3 = this.queryByUser(kkd101, "3");
		
		objList.add(UserResponse_1);			//未得到求购者反馈的响应列表
		objList.add(UserResponse_2);			//被求购者拒绝的响应列表
		objList.add(UserResponse_3);			//被求购者肯定确认的响应列表
		
		return objList;
	}
	
	/**
	 * 	根据响应id删除响应
	 * @return
	 * @throws Exception
	 */
	private boolean deleteResponse() throws Exception
	{
		String sql = "delete from kb08 where kkb801 = ?";
		Object args[] = 
			{
				this.get("kkb801")	
			};
		return this.executeUpdate(sql, args) > 0;
	}
	
	/**
	 * 	根据响应流水号更新响应状态
	 * kkb801为响应流水号
	 * kkb802为响应状态
	 * @return
	 * @throws Exception
	 */
	private boolean updateResponse() throws Exception
	{
		String sql = "update kb08 set kkb802 = ? where kkb801 = ?";
		Object args[] = 
			{
				this.get("kkb802"),
				this.get("kkb801")
			};
		return this.executeUpdate(sql, args) > 0;
	}
}
