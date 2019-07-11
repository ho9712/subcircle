package com.subcircle.system.tools;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import com.subcircle.system.db.DBUtils;

public class Tools 
{

	public static void main(String[] args) 
	{
		String pwd="root";
		try 
		{
			System.out.println(Tools.getMd5(pwd));
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 私有化构造器，防止该类被实例化
	 */
	private Tools() {}
	

	/**
	 * 获取主键名对应的当前主键值
	 * @param pkname  ---  所要获取主键值对应的主键名
	 * @return
	 * @throws Exception
	 */
	public static int getPk(String pkname)throws Exception
	{
		PreparedStatement pstm1=null;  //查询对应主键名是否存在主键值
		PreparedStatement pstm2=null;  //更新主键值或插入新主键值
		ResultSet rs=null;
		try
		{
			int pk=0;
			String sql1="select s.pkvalue from sequence s where pkname=?";
			pstm1=DBUtils.prepareStatement(sql1);
			pstm1.setObject(1, pkname);
			rs=pstm1.executeQuery();
			if(rs.next())  //如果已存在此主键值，则直接将该主键值获取，并更新此主键值+1
			{
				pk=rs.getInt(1);
				String sql2="update sequence set pkvalue=? where pkname=?";
				pstm2=DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, ++pk);
				pstm2.setObject(2, pkname);
				pstm2.executeUpdate();
			}
			else  //若不存在此主键值，则插入一条新的主键值
			{
				String sql2="insert into sequence(pkname,pkvalue) values(?,?)";
				pstm2=DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, pkname);
				pstm2.setObject(2, ++pk);
				pstm2.executeUpdate();
			}
			return pk;
		}
		finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
	}

	/**
	 * 将dto中的字符串数组转换成连接起来的字符串
	 * @param value
	 * @return
	 */
	public static String joinStringArray(Object value) 
	{
		//拦截空值
		if(value==null || value.equals(""))
		{
			return "";
		}
		//判断是String还是String[]
		if(value instanceof String[])  //若为String[]，则将字符串数组中的元素通过","拼接成一个String并返回
		{
			//将传来的Object参数类型转换为String[]
			String[] tmp=(String[])value;
			StringBuilder res=new StringBuilder(tmp[0]);
			for(int i=1;i<tmp.length;i++)
			{
				res.append(",").append(tmp[i]);
			}
			return res.toString();
		}
		else  //若为String，则直接转换成字符串返回
		{
			return value.toString();
		}
	}
	
	/**
	 * 通过提交的请求自动生成DTO 
	 * @param request
	 * @return
	 */
	public static Map<String, Object> createDto(HttpServletRequest request)
	{
		
		/**从表单中获取所有变量，并放入Map<String,String[]> tmp中，
		 * 其中tmp的key是表单中标签的name，
		 * value类型为String[]，可以有一个或多个值
		 */
		Map<String, String[]> tmp=request.getParameterMap();
		
		//计算dto安全初始容量
		int initSize=((int)(tmp.size()/0.75))+1;
		
		//定义存放tmp中所有键值对的集合entrySet，并从tmp中将所有键值对放入其中
		//一个Entry<String,String[]>代表一个键值对，Map中包含多个Entry
		Set<Entry<String, String[]>> entrySet=tmp.entrySet();
		
		//定义dto,用于存储传递用的数据
		Map<String, Object> dto=new HashMap<>(initSize);

		//遍历entrySet，将其中每一个键值对中的value String[]转换成单个String或String[]存入dto中
		for(Entry<String,String[]> entry:entrySet)
		{
			//判断每个键值对中的value String[]包含元素是单个还是多个
			if(entry.getValue().length==1)
			{
				//判断传递的值是否为空
				if(entry.getValue()[0]!=null && !entry.getValue()[0].equals(""))
				{
					//若传递的值不为空才将其存入dto中
					dto.put(entry.getKey(), entry.getValue()[0]);
				}
			}
			else
			{
				dto.put(entry.getKey(), entry.getValue());
			}
		}
		return dto;
	}
	
	/***************************************************************************
	 *                    MD5Begin
	 ***************************************************************************/
	
	
	   public static String getMd5(Object pwd)throws Exception
	   {
			/**
			 * MD5二次混淆加密
			 */
			//完成原始加密
			String md5pwd1=Tools.MD5Encode(pwd);
			//生成混淆明文
			String pwd2=md5pwd1+"隐技フャゥソツ巧ΧΤΚㄕㄣˇΒ于无形:以無にはたコをっㄘㄗㄡεωぅ法為有法,以無ㄤㄆмязр限為有限"+md5pwd1;
			String md5pwd2=Tools.MD5Encode(pwd2);
			return md5pwd2;

	   }
	
	   
	    private final static String[] hexDigits = {
		     "0", "1", "2", "3", "4", "5", "6", "7",
		     "8", "9", "a", "b", "c", "d", "e", "f"
		     };

		  /**
		   * 转换字节数组为16进制字串
		   * @param b 字节数组
		   * @return 16进制字串
		   */
		  private static String byteArrayToHexString(byte[] b)
		  {
		      StringBuffer resultSb = new StringBuffer();
		      for (int i = 0; i < b.length; i++)
		      {
		         resultSb.append(byteToHexString(b[i]));
		      }
		      return resultSb.toString();
		  }
		  /**
		   * 转换字节为16进制字符串
		   * @param b byte
		   * @return String
		   */
		  private static String byteToHexString(byte b)
		  {
		      int n = b;
		      if (n < 0)
		         n = 256 + n;
		      int d1 = n / 16;
		      int d2 = n % 16;
		      return hexDigits[d1] + hexDigits[d2];
		  }
		  /**
		   * 得到MD5的秘文密码
		   * @param origin String
		   * @throws Exception
		   * @return String
		   */
		  private static String MD5Encode(Object origin) throws Exception
		  {
		       String resultString = null;
		       try
		       {
		           resultString=new String(origin.toString());
		           MessageDigest md = MessageDigest.getInstance("MD5");
		           resultString=byteArrayToHexString(md.digest(resultString.getBytes()));
		           return resultString;
		       }
		       catch (Exception ex)
		       {
		          throw ex;
		       }
		  }	
	/***************************************************************************
	 *                    MD5End
	 ***************************************************************************/

}
