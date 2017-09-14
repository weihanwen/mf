package com.jyw.util.wxpay;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class WXPayConfigImpl extends WXPayConfig{

    private byte[] certData;
    private static WXPayConfigImpl INSTANCE;
    public static String appid="";
    public static String mchid="";
    public static String key="";
  
	public static void setMchid(String mchid) {
		WXPayConfigImpl.mchid = mchid;
	}
	public static void setKey(String key) {
		WXPayConfigImpl.key = key;
	}
	public static void setAppid(String appid) {
		WXPayConfigImpl.appid = appid;
	}
 
	
	

	private WXPayConfigImpl() throws Exception{
     	String certPath = "C://wxpay/apiclient_cert.p12";
		setKey("sdkiefnf1ka7dfaldfdkkdnfjadkf5WS");
		setMchid("1488207392");
		setAppid("wx53296db0563ea4d6");
        File file = new File(certPath);
        InputStream certStream = new FileInputStream(file);
        this.certData = new byte[(int) file.length()];
        certStream.read(this.certData);
        certStream.close();
    }

    public static WXPayConfigImpl getInstance() throws Exception{
    	 INSTANCE = new WXPayConfigImpl();
         return INSTANCE;
    }

    public String getAppID() {
        return appid;
    }

    public String getMchID() {
        return mchid;
    }

    public String getKey() {
        return key;
    }

    public InputStream getCertStream() {
        ByteArrayInputStream certBis;
        certBis = new ByteArrayInputStream(this.certData);
        return certBis;
    }


    public int getHttpConnectTimeoutMs() {
        return 2000;
    }

    public int getHttpReadTimeoutMs() {
        return 10000;
    }

    IWXPayDomain getWXPayDomain() {
        return WXPayDomainSimpleImpl.instance();
    }

    public String getPrimaryDomain() {
        return "api.mch.weixin.qq.com";
    }

    public String getAlternateDomain() {
        return "api2.mch.weixin.qq.com";
    }

    @Override
    public int getReportWorkerNum() {
        return 1;
    }

    @Override
    public int getReportBatchSize() {
        return 2;
    }
}
