package com.subcircle.services.kaimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.subcircle.system.tools.Tools;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka04Services extends JdbcServicesSupport 
{
	/**
     * 目前无用
     * @return
     * @throws Exception
     */
	public Map<String,String> findById()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select x.kka102,x.kka103,a.kkd105,x.kka105")
    			.append("  from ka01 x,kd01 a")
    			.append(" where a.kka101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("kka101"));
    }
	
	
	/**
     * 目前无用
     * @return
     * @throws Exception
     */
	  public List<Map<String,String>> queryByCondition()throws Exception
	  {
	  		//还原页面查询条件
	  		Object kka102=this.get("qkka102");     //贴子名称  模糊查询
	  		Object kka103=this.get("qkka103");     //话题
	  		Object kkd101=this.get("qkkd101");     //用户信息
	  		Object kkd105=this.get("qkkd105");     //作者
	  		Object kka105=this.get("qkka105");     //时间
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.kka102,b.fvalue cnkka103,x.kka104,a.kkd105,x.kka105")
	  				.append(" from ka01 x,kd01 a,syscode b ")
	  				.append(" where x.kka103=b.fcode and b.fname='kka103'")
	  				.append(" order by x.kka105 DESC")
	  				;
	  		
	  		
	  		//参数列表
//	  		List<Object> paramList=new ArrayList<>();
//	  		//逐一判断查询条件是否录入,拼接AND条件
//	  		if(this.isNotNull(kka102))
//	  		{
//	  			sql.append(" and x.kka102 like ?");
//	  			paramList.add("%"+kka102+"%");
//	  		}
//	  		if(this.isNotNull(kka103))
//	  		{
//	  			sql.append(" and x.kka103=?");
//	  			paramList.add(kka103);
//	  		}
//	  		if(this.isNotNull(kkd101))
//	  		{
//	  			sql.append(" and x.kkd101=1");
//	  			paramList.add(kkd101);
//	  		}
//	  		if(this.isNotNull(kkd105))
//	  		{
//	  			sql.append(" and x.kkd105=?");
//	  			paramList.add(kkd105);
//	  		}
//	  		if(this.isNotNull(kka105))
//	  		{
//	  			sql.append(" and x.kka105=?");
//	  			paramList.add(kka105);
//	  		}
	  		
	  		//sql.append(" order by x.kka102");
	  		Object args[] ={};
	  		return this.queryForList(sql.toString(), args);
	  }
	  
	  
	  
	    /**
	     * 收藏喜爱贴子，向收藏表录入数据
	     * @return
	     * @throws Exception
	     */
		 private boolean addCollection() throws Exception
		    {
		    	//1.编写SQL语句
		    	StringBuilder sql=new StringBuilder()
		    			.append("insert into ka04(kkd101,kka101,kka402,kka403)")
		    			.append("          values(?,?,CURRENT_TIMESTAMP,1)")
		    			;
		    	
		    	//2.编写参数数组
		    	Object args[]=
		    		{  
		    		    //此处硬编码用户流水号为1，以后通过获取用户流水号动态更新。
		    			"1",
		    			this.get("kka101")	
		    	    };
		        return this.executeUpdate(sql.toString(), args)>0;	
		    }
  
}
