package com.subcircle.services.kaimpl;

import java.util.List;
import java.util.Map;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka02Services extends JdbcServicesSupport
{   
	
	/**
     * 目前无用
     * @return
     * @throws Exception
     */
	@Override
	public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select x.kka102,x.kka103,a.kkd105,x.kka104,x.kka105,x.kka106")
    			.append("  from ka01 x,kd01 a")
    			.append(" where x.kka106=1 and x.kka101=?")
    			;
    	Object args[] = {this.get("kka101")};
    	return this.queryForMap(sql.toString(), args);
    }
	
	
	/**
     * 目前无用
     * @return
     * @throws Exception
     */
	public List<Map<String,String>> queryByCondition()throws Exception
	  {
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.kka201,x.kka202,x.kka203,a.kkd105,b.kka101")
	  				.append(" from ka02 x,kd01 a,ka01 b ")
	  				.append(" where x.kka103=1")
	  				.append(" order by x.kka203")
	  				;
	  		Object args[] ={};
	  		return this.queryForList(sql.toString(), args);
	  }
	
	
	/**
     * 在贴子详情页面回复/评论贴子
     * @return
     * @throws Exception
     */
	private boolean postContent()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ka02(kkd101,kka101,kka202,kka203,kka204,ka02_kka201)")
    			.append("          values(?,?,?,CURRENT_TIMESTAMP,1,0)")
    			;
    	//2.编写参数数组
    	Object args[]=
    		{
    			"1",
    			this.get("kka101"),
    			this.get("kka202"),
    	    };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	/**
     * 在贴子详情页面对回复/评论进行回复
     * @return
     * @throws Exception
     */
	private boolean postAnswer()throws Exception
    {
		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ka02(kkd101,kka101,kka202,kka203,kka204,ka02_kka201)")
    			.append("          values(?,?,?,CURRENT_TIMESTAMP,1,?)")
    			;
    	//2.编写参数数组
    	Object args[]=
    		{
    			"1",
    			this.get("kka101"),
    			this.get("kka202"),
    			this.get("kka201"),
    	    };
    	System.out.println("ceshi :"+this.get("kka201"));
        return this.executeUpdate(sql.toString(), args)>0;	
    }
}
