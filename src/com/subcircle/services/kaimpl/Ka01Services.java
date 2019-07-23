package com.subcircle.services.kaimpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.subcircle.system.tools.Tools;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka01Services extends JdbcServicesSupport 
{
	
	/**
     * 根据贴子流水号查询贴子详情，用于显示某贴子详情
     * @return
     * @throws Exception
     */
	@Override
	public Map<String,String> findById()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select  x.kka101, x.kka102, b.fvalue cnkka103, a.kkd101,a.kkd105,a.kkd108,a.kkd102,x.kka104,date_format(x.kka105,'%Y-%m-%d %H:%i') kka105")
    			.append("  from ka01 x,kd01 a, syscode b")
    			.append("  where x.kkd101 = a.kkd101 and b.fname = 'kka103' and b.fcode = x.kka103 ")
    		    .append("  and  x.kka106=1 and x.kka101=? ")
    			;
    	//执行查询 
    	Object args[] = {this.get("kka101")};
    	return this.queryForMap(sql.toString(), args);
    }
	
	
	/**
     * 条件查询，根据类型选择和搜索框输入内容的模糊匹配  检索贴子列表
     * @return
     * @throws Exception
     */
	public List<Map<String,String>> queryByCondition()throws Exception
	{
		Object id=this.get("id");
		Object search=this.get("search_text");
		Object kkc101=this.get("kkc101");
		Object page=this.get("page");
		
		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select x.kka101,x.kka102,b.fvalue cnkka103,x.kka104,a.kkd105,date_format(x.kka105,'%Y-%m-%d %H:%i') kka105")
  				.append(" from ka01 x,kd01 a,syscode b ")
  				.append(" where x.kka103=b.fcode and b.fname='kka103' and x.kkd101 = a.kkd101")
  				.append(" and x.kka106 = 1")
  				; 
  				
  		List<Object> paras=new ArrayList<>();
  		if(isNotNull(kkc101))
  		{
  			sql.append(" and x.kkc101=?");
  			paras.add(kkc101);
  		}
  		if(id!=null && id.toString().equals("0"))
  		{
  		}
  		else if(id!=null && id.toString().equals("1"))
  		{
  			sql.append(" and x.kka103=1");
  		}
  		else if(id!=null && id.toString().equals("2"))
  		{
  			sql.append(" and x.kka103=2");
  		}
  		else if(id!=null && id.toString().equals("3"))
  		{
  			sql.append(" and x.kka103=3");
  		}
  		if(search!=null && !search.toString().equals(""))
  		{
  			sql.append(" and (x.kka102 like ? or x.kka104 like ?)");
  			paras.add("%"+search+"%");
  			paras.add("%"+search+"%");
  		}
		sql.append(" order by x.kka105 desc");
		if(isNotNull(page))
		{
			sql.append(" limit ?,12");
			paras.add((Integer.parseInt(page.toString())-1)*12);
		}
		else
		{
			sql.append(" limit 0,12");
		}
  		return this.queryForList(sql.toString(),paras.toArray());
		
	}
	
	//查询贴子总数
	public Map<String, String> postCount()throws Exception
	{
		Object id=this.get("id");
		Object search=this.get("search_text");
		Object kkc101=this.get("kkc101");
		
		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select count(*) count")
  				.append(" from ka01 x,kd01 a,syscode b ")
  				.append(" where x.kka103=b.fcode and b.fname='kka103' and x.kkd101 = a.kkd101")
  				.append(" and x.kka106 = 1")
  				; 
  				
  		List<Object> paras=new ArrayList<>();
  		if(isNotNull(kkc101))
  		{
  			sql.append(" and x.kkc101=?");
  			paras.add(kkc101);
  		}
  		if(id!=null && id.toString().equals("0"))
  		{
  		}
  		else if(id!=null && id.toString().equals("1"))
  		{
  			sql.append(" and x.kka103=1");
  		}
  		else if(id!=null && id.toString().equals("2"))
  		{
  			sql.append(" and x.kka103=2");
  		}
  		else if(id!=null && id.toString().equals("3"))
  		{
  			sql.append(" and x.kka103=3");
  		}
  		if(search!=null && !search.toString().equals(""))
  		{
  			sql.append(" and (x.kka102 like ? or x.kka104 like ?)");
  			paras.add("%"+search+"%");
  			paras.add("%"+search+"%");
  		}
  		return this.queryForMap(sql.toString(), paras.toArray());
	}
	
	/**
     * 查询热点贴子。根据回复数目排序
     * @return
     * @throws Exception
     */
	public List<Map<String,String>> queryHotPost()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a1.kka101,a1.kka102,a1.kka106,c.fvalue cnkka103,b.number")
    			.append("  from ka01 a1,syscode c,(select ss.kka101, count(ss.kka201)  number")
    			.append("								from (select x.kka201,b.kka101")
    			.append("											from ka02 x,ka01 b")
    			.append("											where  b.kka101 = x.kka101) ss ")
    			.append("											group by ss.kka101) b")
    			.append(" where a1.kka103=c.fcode and c.fname='kka103' and a1.kka101=b.kka101 and a1.kka106 =1")
    			.append(" ORDER BY number DESC")
    			;
    	//执行查询 
    	Object args[] ={};
    	return this.queryForList(sql.toString(),args);
    }
	 
	
	/**
     * 在论坛上发帖，向贴子表录入数据
     * @return
     * @throws Exception
     */
	private boolean posting() throws Exception
    {
		int kka101=Tools.getPk("kka101");
    	//1.编写SQL语句
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ka01(kka101,kkd101,kka102,kka103,kka104,kka105,kka106,kkc101)")
    			.append("          values(?,?,?,?,?,CURRENT_TIMESTAMP,1,?)")
    			;
    	//2.编写参数数组
    	Object args[]=
    		{
    			kka101,
    			this.get("kkd101"),
    			this.get("kka102"),
    			this.get("kka103"),
    			this.get("kka104"),
    			this.get("kkc101"),
    	    };
    	this.appendSql(sql1.toString(), args);
    	StringBuilder sql2=new StringBuilder()
    			.append("insert into ka02(kka201,kka101,kkd101,kka202,kka203,kka204,ka02_kka201)")
    			.append(" values(0,?,?,'1',current_timestamp,1,0)")
    			;
    	Object[] args2={
    			kka101,
    			this.get("kkd101"),
    	};
    	this.appendSql(sql2.toString(), args2);
    	return this.executeTransaction();
    }
	 

	        
	    /**
	     * 管理员功能--删帖，实际操作为更改帖子表kka106属性值，从1（未删除）更改为0（已删除）
	     * @return
	     * @throws Exception
	     */
	 private boolean delPost()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append("update ka01 a")
	    			.append("   set a.kka106=?")
	    			.append(" where a.kka101=?")
	    			;
	    	Object args[]={
	    			0,
                this.get("kka101")
	    	};
	      boolean flag = this.executeUpdate(sql.toString(), args)>0;
			
	          if (flag) 
			  {
				
				
				StringBuilder sql2=new StringBuilder()
						.append("insert into kd02(kkd202,kkd203,kkd204,kkd205,kkd206,kkd207,kkd208,kkd209)")
						.append("     values (?,?,?,?,?,current_timestamp,'0','0')")
						;
			    
				Object[] args2={
					this.get("kkd202"),	
					this.get("kkd203"),
					"贴子违规消息反馈",
				    "您发布的标题为“" + this.get("kka102") + "”的贴子涉嫌违规，已被管理员删除。请注意您的言论及措辞！",
					"0"
				               };
				this.executeUpdate(sql2.toString(), args2);
		     }
	               return flag;
	    
	    }
	 
	   
	 
	    /**
	     * 查询贴子详细信息页面下 其他用户的回复信息，包括对对贴子下回复的回复
	     * @return
	     * @throws Exception
	     */
	   private List<Map<String,String>> query02Services()throws Exception
	    {
	  		
	  	//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.kka201,x.kka202,date_format(x.kka203,'%Y-%m-%d %H:%i') kka203,x.kka204,x.ka02_kka201,a.kkd102,date_format(b.kka105,'%Y-%m-%d %H:%i') kka105,b.kka101,c.kka202 rootAnswer,c.kka204 delSign")
	  				.append("       ,a.kkd101,a.kkd105,a.kkd108")
	  				.append(" from ka02 x,kd01 a,ka01 b,ka02 c ")
	  				.append(" where x.kka201!=0 and x.kkd101 = a.kkd101 and b.kka101 = x.kka101 and b.kka101 =? and x.ka02_kka201=c.kka201 and x.kka101 = c.kka101")
	  				.append(" order by x.kka203")
	  				;
	  		
	  		
	  		Object args[] =
	  			{
	  				this.get("kka101")
	  		    };
	  		List<Map<String,String>> rows=this.queryForList(sql.toString(), args);
	  		return rows;
	     }
	    
	
	 
	    /**
	     * 将贴子详细信息页面下 其他用户的回复信息列表存入Map中
	     * @return
	     * @throws Exception
	     */
	   public Map<String, Object> queryInMap() throws Exception 
	     {
		  Map<String, Object> objMap = new HashMap<>();
		  List<Map<String,String>> queryForAnswer = query02Services();
		  objMap.put("queryForAnswer", queryForAnswer);
		  return objMap;
	     }
  
 }	  

