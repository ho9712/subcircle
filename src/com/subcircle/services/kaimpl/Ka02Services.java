package com.subcircle.services.kaimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.omg.Messaging.SyncScopeHelper;

import com.subcircle.system.tools.Tools;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka02Services extends JdbcServicesSupport
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
    			.append("select  x.kka101, x.kka102, b.fvalue cnkka103, a.kkd101,a.kkd105,a.kkd102,x.kka104,x.kka105")
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
     * ����������ҳ��ظ�/��������
     * @return
     * @throws Exception
     */
	private boolean postContent()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ka02(kkd101,kka101,kka201,kka202,kka203,kka204,ka02_kka201)")
    			.append("          values(?,?,?,?,CURRENT_TIMESTAMP,1,0)")
    			;
    	//2.��д��������
    	Object args[]=
    		{
    			this.get("kkd101"),
    			this.get("kka101"),
    			Tools.getReplyId(this.get("kka101").toString()),
    			this.get("kka202")
    	    };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	/**
     * ����������ҳ��Իظ�/���۽��лظ�
     * @return
     * @throws Exception
     */
	private boolean postAnswer()throws Exception
    {
		
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ka02(ka02_kka201,kkd101,kka101,kka201,kka202,kka203,kka204)")
    			.append("          values(?,?,?,?,?,CURRENT_TIMESTAMP,1)")
    			;
    	//2.��д��������
    	Object args[]=
    		{
    			this.get("kka201-2"),
    			this.get("kkd101"),
    			this.get("kka101"),
    			Tools.getReplyId(this.get("kka101").toString()),
    			this.get("kka202")
    	    };
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	
	            
	/**
	 * ����Ա����--ɾ���ӻظ���ʵ�ʲ���Ϊ���Ļظ���kka204����ֵ����1��δɾ��������Ϊ0����ɾ����
	 * @return
	 * @throws Exception
	 */
	private boolean delAnswer()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ka02 a")
    			.append("   set a.kka204=?")
    			.append(" where a.kka201=? and a.kka101=?")
    			;
    	Object args[]=
    		{
    			0,
    			this.get("kka201"),
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
			            "�ظ�Υ����Ϣ����",
			            "������������Ϊ��" + this.get("kka202") +  "���Ļظ�����Υ�棬�ѱ�����Աɾ������ע���������ۼ���ǣ�",
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
		  				.append("select x.kka201,x.kka202,x.kka203,x.kka204,x.ka02_kka201,a.kkd102,a.kkd105,b.kka101,c.kka202 rootAnswer,c.kka204 delSign")
		  				.append("       ,a.kkd101,a.kkd105,a.kkd108")
		  				.append(" from ka02 x,kd01 a,ka01 b,ka02 c ")
		  				.append(" where x.kka201!=0 and x.kkd101 = a.kkd101 and b.kka101 = x.kka101 and b.kka101 =? and x.ka02_kka201=c.kka201 and x.kka101 = c.kka101")
		  				.append(" order by x.kka203")
		  				;
	  		
	  		
	  		Object args[] =
	  			{
	  				this.get("kka101"),
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
