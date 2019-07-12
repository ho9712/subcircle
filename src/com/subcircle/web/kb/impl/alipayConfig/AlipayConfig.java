package com.subcircle.web.kb.impl.alipayConfig;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101100659445";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCJ0PRKWTfRG40s7jY8d7FfYWpw4F/WeL9Frs+9LdepLYB33lXxr5tz6KU/KR1mDufZN/V6fkS4Qk3FQyIvGwARIy6gAxu3keCQekqC6n+ZCSoX35TYtKsN7xYuOUhPLEywueXWJdoq6ALtfBWIfyuMkaJ+yt4jm3k0oEzZmFmgz+2tSQYUQMnB6OQudlVyhhqsGR/qMiKtFFQv2EWSCpMsjwFzBBBjk+vl9b/Y0GwnEOCPmRq4bHQaDAKDN3xEavXjf+x/ARioMqCa5N2Zx019hzazKj2O4UKMLhJtqknX55YBSgVX/Jc04Y26yBu02LRGvqSnMb+5LlCW/Fpy6gHfAgMBAAECggEAVtPpNXZkbkBXf7lNPmeCvr8XWqpidzN3/qUWiO/68cGTMPJJX43t+ObYRaTXutclR3u0E0q+bQCJEwEq5layghmSZInQyqUDwMLrcvPfFEHr3UKl+qpJIuxBIzo/znHwl19n6LXMcD/gqFMHFgpZG6UdpZiWwARSJs/f2y/bOC8aCeXp73KqEX32zMqj8QJEPLpJUx3xa5jSHuK90FAJunRE3kEFYduNQOg5hwoC5QXv3z3PYtEKMfC8tHcwiDytQQqe5pbgolXrEyj0dNOy9yki5sUu/iZclOyrCv+PDavMQ9hpxCGbPaJW7BeztwZQC63bJYhyhdjUK1T682jjkQKBgQDTjn4Hswak0ZmwQZlSanUcYTH770VWNC0L5BOj8BXPtGaqf1rBeWvYNhe1B21m83hgydct2OXPaCYNwhvqWp2rE3nbPNaketGcBOzJJXXd2g81IB50PVP4dvjip3M6AhxBQ+6wEsO9VAeUQA9VGJxYqlCz9cReo+2sMxpR+AjLYwKBgQCmxLTfeGYxQ3B+ytdHSKg98tJevEvw+yPiKH8y6wS1tvB05REvpgl6ngoMKWSlKAidgChiJj22TAaTpEczIWirKcBnbn9f3uuOMgYrNbveDlti50Erl+0sv6bYmonIV0h/fCpONhw5INBS5NAp4Yb/8xgmtjEAuFSIJEnCGDm+VQKBgCEEN/8TnZHTdFzhoAAQxT4snRRofzW45t7YNYh8S6siyHMLdSqEvKP9rS1/fz919++DEKYDF7qK0oWLKbgldD3iyD3C/Oymjlf/HMU3p3F8Oqtb2+TgPV6lkqos3/rJoYc+Bt5Lz2iY2KX2aW4qbRwZWIb9cCwlAU7CmvT39MdpAoGBAIVl3aTQAzau0mKp0JBVvzZmcP6Usk5eJXL3n9/T/J16a1emEBxEPVrW5gSaa8Zsgo+x/xubqUuT/sLE6qssszQPHrfdvIesolHJFAQmZFOYumMfxpKfYXmlCEpFO6eEohpP8OtE/0h3Rgy4uQZ3P2ynQI9et03zJLMOC+31QONNAoGBAMjditgMCHvfd0Cof2Q2JUZxaa9WmSQYa8UfDAwaEX83yvMexhY7Y0kHnDhLQ6hz4xPmxErwzGCf52wzUltlwWhpqeYGGn5DcZ6aK0kfxzdsmsPzAl/8Y/Cz5yzzOYfv1lGgjwOycIzKdBLAhN62VBMBu43A5dnDdbwDomfWTBjC";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxgXdIJ9Y01HhdTcHBFA+pTNzYTHLcfhfsvaKb2sSVw0udThyfeB+wtEkSdHipLbe9enJhU9xdSCh20KaEOup9dOLVkRj602kExQhhyjpamgebsFfyrU8YLKf0j1uAHWygRC5inKCT7kAI0rk9dBWlj3dNt+Idlbmrnh7uxVznn2/AgOL95g5+eN566pY8S2rcH+4Sb1IL8Y4toxwQABDU98H21+5hhQaMcoWV2dLdyjNQ2xJY5bazl+UbjKDd6oAtmXaG6g69ouMFJWvt/Vj3s8vhBUioMOMrHK3maWvALNRcC8zu1+4URoUbdqOP565tafDhb67s+VSeytoSX/sUwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://zhaizhong.natapp1.cc/subcircle/kb/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://zhaizhong.natapp1.cc/subcircle/paySuccessServlet";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

