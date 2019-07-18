package com.subcircle.services.kaimpl;

import com.subcircle.services.support.JdbcServicesSupport;

public class Ka03Services extends JdbcServicesSupport
{
	
	/**
     * 举报违规贴子，向举报表录入数据
     * @return
     * @throws Exception
     */
	 private boolean reportPost() throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ka03(kka101,kka201,kka302,kka303)")
	    			.append("          values(?,?,?,CURRENT_TIMESTAMP)")
	    			;
	    	
	    	//2.编写参数数组
	    	Object args[]=
	    		{  
	    		    //此处硬编码用户流水号为1，以后通过获取用户流水号动态更新。
	    			this.get("kka101"),
	    			0,
	    			this.get("kka302-1")
	    	    };
            
            
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
	
	
	
	/**
     * 举报违规回复，向举报表录入数据
     * @return
     * @throws Exception
     */
	 private boolean reportAnswer() throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ka03(kka101,kka201,kka302,kka303)")
	    			.append("          values(?,?,?,CURRENT_TIMESTAMP)")
	    			;
	    	
	    	//2.编写参数数组
	    	Object args[]=
	    		{  
	    		    //此处硬编码用户流水号为1，以后通过获取用户流水号动态更新。
	    			this.get("kka101"),
	    			this.get("kka201-1"),
	    			this.get("kka302-2"),	
	    	    };
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
}
