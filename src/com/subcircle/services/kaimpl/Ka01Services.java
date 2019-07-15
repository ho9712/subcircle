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
    			.append("select  x.kka101, x.kka102, b.fvalue, a.kkd105,x.kka104,x.kka105")
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
		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append("select x.kka101,x.kka102,b.fvalue cnkka103,x.kka104,a.kkd105,x.kka105")
  				.append(" from ka01 x,kd01 a,syscode b ")
  				.append(" where x.kka103=b.fcode and b.fname='kka103' and x.kkd101 = a.kkd101")
  				.append(" and x.kka106 = 1")
  				; 
  				
  		List<Object> paras=new ArrayList<>();
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
  		return this.queryForList(sql.toString(),paras.toArray());
		
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
	    			.append("insert into ka01(kka101,kkd101,kka102,kka103,kka104,kka105,kka106)")
	    			.append("          values(?,?,?,?,?,CURRENT_TIMESTAMP,1)")
	    			;
	    	//2.��д��������
	    	Object args[]=
	    		{
	    			kka101,
	    			"2",
	    			this.get("kka102"),
	    			this.get("kka103"),
	    			this.get("kka104"),
	    	    };
	    	this.appendSql(sql1.toString(), args);
	    	StringBuilder sql2=new StringBuilder()
	    			.append("insert into ka02(kka201,kka101,kkd101,kka202,kka203,kka204,ka02_kka201)")
	    			.append(" values(0,?,?,'1',current_timestamp,1,0)")
	    			;
	    	Object[] args2={
	    			kka101,
	    			1,
	    	};
	    	this.appendSql(sql2.toString(), args2);
	    	return this.executeTransaction();
	    }
	 
	 
	 
	    /**
	     * ��ѯ������ϸ��Ϣҳ���� �����û��Ļظ���Ϣ
	     * @return
	     * @throws Exception
	     */
	 private List<Map<String,String>> query02Services()throws Exception
	  {// Object kka101=this.get("kka101");
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.kka201,x.kka202,x.kka203,x.kka204,x.ka02_kka201,a.kkd105,b.kka101")
	  				.append(" from ka02 x,kd01 a,ka01 b ")
	  				.append(" where x.kkd101 = a.kkd101 and b.kka101 = x.kka101 and b.kka101 =? ")
	  				.append(" order by x.kka203")
	  				//.append(" where a.kkd101=1")    //ģ���û�1
	  				;

	  		Object args[] =
	  			{
	  				this.get("kka101"),
	  				//this.get("kka101"),
	  		    };
	  		List<Map<String,String>> rows=this.queryForList(sql.toString(), args);
	  		rows.remove(0);
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

