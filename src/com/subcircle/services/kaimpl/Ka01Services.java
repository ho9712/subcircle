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
     * ����������ˮ�Ų�ѯ�������飬������ʾĳ��������
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
    	//ִ�в�ѯ 
    	Object args[] = {this.get("kka101")};
    	return this.queryForMap(sql.toString(), args);
    }
	
	
	/**
     * ������ѯ����������ѡ����������������ݵ�ģ��ƥ��  ���������б�
     * @return
     * @throws Exception
     */
	public List<Map<String,String>> queryByCondition()throws Exception
	{
		Object id=this.get("id");
		Object search=this.get("search_text");
		Object kkc101=this.get("kkc101");
		Object page=this.get("page");
		
		//����SQL����
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
	
	//��ѯ��������
	public Map<String, String> postCount()throws Exception
	{
		Object id=this.get("id");
		Object search=this.get("search_text");
		Object kkc101=this.get("kkc101");
		
		//����SQL����
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
     * ��ѯ�ȵ����ӡ����ݻظ���Ŀ����
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
    	//ִ�в�ѯ 
    	Object args[] ={};
    	return this.queryForList(sql.toString(),args);
    }
	 
	
	/**
     * ����̳�Ϸ����������ӱ�¼������
     * @return
     * @throws Exception
     */
	private boolean posting() throws Exception
    {
		int kka101=Tools.getPk("kka101");
    	//1.��дSQL���
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ka01(kka101,kkd101,kka102,kka103,kka104,kka105,kka106,kkc101)")
    			.append("          values(?,?,?,?,?,CURRENT_TIMESTAMP,1,?)")
    			;
    	//2.��д��������
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
	     * ����Ա����--ɾ����ʵ�ʲ���Ϊ�������ӱ�kka106����ֵ����1��δɾ��������Ϊ0����ɾ����
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
					"����Υ����Ϣ����",
				    "�������ı���Ϊ��" + this.get("kka102") + "������������Υ�棬�ѱ�����Աɾ������ע���������ۼ���ǣ�",
					"0"
				               };
				this.executeUpdate(sql2.toString(), args2);
		     }
	               return flag;
	    
	    }
	 
	   
	 
	    /**
	     * ��ѯ������ϸ��Ϣҳ���� �����û��Ļظ���Ϣ�������Զ������»ظ��Ļظ�
	     * @return
	     * @throws Exception
	     */
	   private List<Map<String,String>> query02Services()throws Exception
	    {
	  		
	  	//����SQL����
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
	     * ��������ϸ��Ϣҳ���� �����û��Ļظ���Ϣ�б����Map��
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

