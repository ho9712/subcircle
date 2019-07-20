package com.subcircle.services.kaimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;

import com.subcircle.system.tools.Tools;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka04Services extends JdbcServicesSupport 
{
	    /**
	     * �ղ�ϲ�����ӣ����ղر�¼������
	     * @return
	     * @throws Exception
	     */
		 private boolean addCollection() throws Exception
		    {   
			   //1.��дSQL���
		    	StringBuilder sql=new StringBuilder()
		    			.append("select kka401,kkd101,kka101,kka402 from  ka04")
		    			.append(" where kkd101=? and kka101=?")
		    			;
		    	Object args[]=
		    		{  
		    			this.get("kkd101"),
		    			this.get("kka101")	
		    	    };
			 
		       Map<String,String> result = this.queryForMap(sql.toString(),args);
		        
		        if(result!=null)
		        {
		        	return false;
		        }
		    	
		        else
		        {
		    	   //1.��дSQL���
		    	  StringBuilder sql2=new StringBuilder()
		    			.append("insert into ka04(kkd101,kka101,kka402)")
		    			.append("          values(?,?,CURRENT_TIMESTAMP)")
		    			;
		    	
		    	  //2.��д��������
		    	   Object args2[]=
		    		{  
		    			this.get("kkd101"),
		    			this.get("kka101")	
		    	    };
		        return this.executeUpdate(sql2.toString(), args2)>0;	
		    }

		    }
}





