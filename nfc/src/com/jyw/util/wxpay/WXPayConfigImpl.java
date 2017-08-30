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
    public static String type="";
  
	public static void setMchid(String mchid) {
		WXPayConfigImpl.mchid = mchid;
	}
	public static void setKey(String key) {
		WXPayConfigImpl.key = key;
	}
	public static void setAppid(String appid) {
		WXPayConfigImpl.appid = appid;
	}
	public static void setType(String type) {
		WXPayConfigImpl.type = type;
	}
	
	

	private WXPayConfigImpl(String type) throws Exception{
    	String certPath ="";
    	if(type.equals("1")){
    		certPath = "C://wx1/apiclient_cert.p12";
    		setKey("dfkash4a67drfvde5q9f5rw344wad1f8");
    		setMchid("1390186002");
    		setAppid("wx041bbb9db8f1e96b");
    		setType("1");
    	}else if(type.equals("2")){
    		certPath = "C://wx2/apiclient_cert.p12";
    		setKey("41rj1qy23o4wrc2g8hdcq23549jfk59c");
    		setMchid("1372729202");
    		setAppid("wx8d24d584280be57b");
    		setType("2");
    	}else{
    		certPath = "C://wx3/apiclient_cert.p12";
    		setKey("a464afo556djfqaj456asdjflha467df");
    		setMchid("1366844902");
    		setAppid("wx62d81eec40f745b4");
    		setType("3");
    	}
         File file = new File(certPath);
        InputStream certStream = new FileInputStream(file);
        this.certData = new byte[(int) file.length()];
        certStream.read(this.certData);
        certStream.close();
    }

    public static WXPayConfigImpl getInstance(String _type) throws Exception{
    	 INSTANCE = new WXPayConfigImpl(_type);
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
