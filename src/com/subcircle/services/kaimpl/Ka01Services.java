package com.subcircle.services.kaimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.subcircle.system.tools.Tools;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka01Services extends JdbcServicesSupport 
{
	@Override
	public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select x.kka102,x.kka103,a.kkd105,x.kka105")
    			.append("  from ka01 x,kd01 a")
    			.append(" where a.kka101=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("kka101"));
    }
	/**
     * ����������ѯ
     * @return
     * @throws Exception
     */
	  public List<Map<String,String>> queryByCondition()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object kka102=this.get("qkka102");     //��������  ģ����ѯ
	  		Object kka103=this.get("qkka103");     //����
	  		Object kka104=this.get("qkka104");     //����
	  		Object kkd101=this.get("qkkd101");     //�û���Ϣ
	  		Object kkd105=this.get("qkkd105");     //����
	  		Object kka105=this.get("qkka105");     //ʱ��
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.kka102,b.fvalue cnkka103,x.kka104,a.kkd105,x.kka105")
	  				.append(" from ka01 x,kd01 a,syscode b ")
	  				.append(" where x.kka103=b.fcode and b.fname='kka103'")
	  				.append(" order by x.kka105 DESC")
	  				//.append(" where a.kkd101=1")    //ģ���û�1
	  				;
	  		
	  		
	  		//�����б�
//	  		List<Object> paramList=new ArrayList<>();
//	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
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
	  
	  public List<Map<String,String>> queryAnimeForum()throws Exception
	  {
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.kka102,b.fvalue cnkka103,x.kka104,a.kkd105,x.kka105")
	  				.append(" from ka01 x,kd01 a,syscode b ")
	  				.append(" where x.kka103=b.fcode and b.fname='kka103' and x.kka103=1")
	  				.append(" order by x.kka105 DESC")
	  				//.append(" where a.kkd101=1")    //ģ���û�1
	  				;
	  		Object args[] ={};
	  		return this.queryForList(sql.toString(), args);
	  }
  
}
