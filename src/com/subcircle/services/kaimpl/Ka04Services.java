package com.subcircle.services.kaimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
		    			.append("insert into ka04(kkd101,kka101,kka402,kka403)")
		    			.append("          values(?,?,CURRENT_TIMESTAMP,1)")
		    			;
		    	
		    	//2.��д��������
		    	Object args[]=
		    		{  
		    		    //�˴�Ӳ�����û���ˮ��Ϊ1���Ժ�ͨ����ȡ�û���ˮ�Ŷ�̬���¡�
		    			"1",
		    			this.get("kka101")	
		    	    };
		        return this.executeUpdate(sql.toString(), args)>0;	
		    }
  
}
