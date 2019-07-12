package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;


import com.subcircle.services.support.JdbcServicesSupport;

public class Kc02Services extends JdbcServicesSupport {
	
	/**
	 * 查询排名信息
	 */
	
	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc202,k.kkc203,k.kkc204,k.kkc205,k.kkc206,k.kkc207,k.kkc208 ")
				.append("from kc02 k ")
				.append("ORDER BY k.kkc208 ")
				.append("LIMIT 12 ");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);		
	}	
	
	
	public  Map<String,String> findById()throws Exception
	
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("select k.kkc202,k.kkc204,k.kkc206,k.kkc207,k.kkc208,")
				.append("       k.kkc209,k.kkc210,k.kkc211,k.kkc212,k.kkc213,")
				.append("       k.kkc214,k.kkc215,k.kkc216,k.kkc217,k.kkc218 ")
				.append("from kc02 k ")
				.append("where k.kkc101=?")
				;
		
		
		return this.queryForMap(sql.toString(),this.get("kkc101"));
		
	}
	
	
	
	
    public boolean addAnimeComment()throws Exception
    {
//    	//获取当前员工编号
//    	String aab103=Tools.getEmpNumber();
//    	//向DTO添加员工编号
//    	this.put("aab103", aab103);
//    	
//    	//1.编写SQL语句
//    	StringBuilder sql=new StringBuilder()
//    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
//    			.append("                 aab107,aab108,aab109,aab110,aab111,")
//    			.append("                 aab112,aab113)")
//    			.append("          values(?,?,?,?,?,")
//    			.append("                 ?,?,?,?,?,")
//    			.append("                 ?,?)")
//    			;
//    	//2.编写参数数组
//    	Object args[]={
//    			this.get("aab102"),
//    			aab103,
//    			this.get("aab104"),
//    			this.get("aab105"),
//    			this.get("aab106"),
//    			this.get("aab107"),
//    			this.get("aab108"),
//    			this.get("aab109"),
//    			this.get("aab110"),
//    			Tools.joinArray(this.get("aab111")),
//    			Tools.joinArray(this.get("aab112")),
//    			this.get("aab113")
//    	};
    	
    	StringBuilder sql1 = new StringBuilder()
    			
    			.append("insert into kc06(kkd101,kkc101,kkc602) ")
    			.append("values(?,?,CURRENT_TIMESTAMP)" );
    	StringBuilder sql2 = new StringBuilder()
    			
    			.append("insert into kc07(kkc101,kkd101,kkc702,kkc703,kkc704) ")
    			.append("values(?,?,?,?,CURRENT_TIMESTAMP)" )
    			
    			
    			;
    	Object args[]={
    			this.get("kkd101"),
    			this.get("kkc101"),
    			this.get("kkc101"),
    			this.get("kkd101"),
    			this.get("kkc702"),
    			this.get("kkc703")
    			
    			
    			
    	};
    	
    	
    	this.appendSql(sql1.toString(), args);
    	this.appendSql(sql2.toString(), args);
//        return this.executeUpdate(sql1.toString(), args)>0;	
        return this.executeTransaction();
    }
    
	
}
