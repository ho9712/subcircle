package com.subcircle.services.kaimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.subcircle.system.tools.Tools;
import com.subcircle.services.support.JdbcServicesSupport;

public class Ka04Services extends JdbcServicesSupport 
{
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
