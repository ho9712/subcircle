package com.subcircle.services.kaimpl;

import com.subcircle.services.support.JdbcServicesSupport;

public class Ka03Services extends JdbcServicesSupport
{
	 /**
     * �ٱ�Υ�����ӣ���ٱ���¼������
     * @return
     * @throws Exception
     */
	 private boolean report() throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ka03(kka101,kka201,kka302,kka303)")
	    			.append("          values(?,?,?,CURRENT_TIMESTAMP)")
	    			;
	    	
	    	//2.��д��������
	    	Object args[]=
	    		{  
	    		    //�˴�Ӳ�����û���ˮ��Ϊ1���Ժ�ͨ����ȡ�û���ˮ�Ŷ�̬���¡�
	    			this.get("kka101"),
	    			this.get("kka201-1"),
	    			this.get("kka302"),	
	    	    };
            System.out.println(args[0]);
            System.out.println(args[1]);
            System.out.println(args[2]);
            
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
}
