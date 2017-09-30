package com.jyw.util;
import java.awt.BasicStroke;  
import java.awt.Color;  
import java.awt.Component;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.Graphics2D;  
import java.awt.print.Book;
import java.awt.print.PageFormat;  
import java.awt.print.Paper;
import java.awt.print.Printable;  
import java.awt.print.PrinterException;  
import java.awt.print.PrinterJob;
import java.util.ArrayList;  
import java.util.Calendar;  
import java.util.List;
  
  
//实现Printable接口 用于创建打印内容  
public class SalesTicket implements Printable {  
	
    private static List<PageData> orderList;  
    private Font font;  
    private static String cashier;
    private static String orderId;  
    private static String allNumber;  
    private static String createTime;  
    private static String name;  
    private static String phone;     
    private static String allMoney;  
    private static String address; 
  
    // 构造函数  
    public SalesTicket(List<PageData> orderList, String cashier, String orderId, String allNumber, String createTime,  
            String allMoney, String address,String name ,String phone) {  
        this.orderList = orderList;  
        this.cashier = cashier;  
        this.orderId = orderId;  
        this.allNumber = allNumber;  
        this.createTime = createTime;  
        this.allMoney = allMoney;  
        this.address = address;  
        this.name = name;  
        this.phone = phone;  
    }  
  
    public SalesTicket() {
		// TODO Auto-generated constructor stub
	}

	/** 
     * @param Graphic指明打印的图形环境 
     * @param PageFormat指明打印页格式（页面大小以点为计量单位，1点为1英才的1/72，1英寸为25.4毫米。A4纸大致为595× 
     *            842点） 
     * @param pageIndex指明页号 
     **/  
    @Override  
    public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {  
        // 转换成Graphics2D 拿到画笔  
        Graphics2D g2 = (Graphics2D) graphics;  
        // 设置打印颜色为黑色  
        g2.setColor(Color.black);  
  
        // 打印起点坐标  
        double x = pageFormat.getImageableX();  
        double y = pageFormat.getImageableY();  
  
        // 虚线  
        float[] dash1 = { 4.0f };  
        // width - 此 BasicStroke 的宽度。此宽度必须大于或等于 0.0f。如果将宽度设置为  
        // 0.0f，则将笔划呈现为可用于目标设备和抗锯齿提示设置的最细线条。  
        // cap - BasicStroke 端点的装饰  
        // join - 应用在路径线段交汇处的装饰  
        // miterlimit - 斜接处的剪裁限制。miterlimit 必须大于或等于 1.0f。  
        // dash - 表示虚线模式的数组  
        // dash_phase - 开始虚线模式的偏移量  
  
        // 设置画虚线  
        g2.setStroke(new BasicStroke(0.5f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_MITER, 4.0f, dash1, 0.0f));  
  
        // 设置打印字体（字体名称、样式和点大小）（字体名称可以是物理或者逻辑名称）  
        font = new Font("宋体", Font.PLAIN, 14);  
        g2.setFont(font);// 设置字体  
        
        float heigth = font.getSize2D();// 字体高度  
        // 标题  
        g2.drawString("九鱼便当", (float) x+40, (float) y+10);    
        float line = 2 * heigth;  
        font = new Font("宋体", Font.PLAIN, 10);  
        g2.setFont(font);// 设置字体  
        heigth = font.getSize2D();// 字体高度  
        // 显示收银员  
        g2.drawString("配送员：" + cashier, (float) x, (float) y + line);  
        line += heigth+3; 
        // 显示订单号  
        g2.drawString("订单号：" + orderId, (float) x , (float) y + line);  
        line += heigth+3;  
        // 显示标题  
        g2.drawString("便当", (float) x, (float) y + line);  
//        g2.drawString("单价", (float) x + 60, (float) y + line);  
        g2.drawString("数量", (float) x + 80, (float) y + line);  
        g2.drawString("总额", (float) x + 105, (float) y + line);  
        line += heigth;  
        g2.drawLine((int) x, (int) (y + line), (int) x + 158, (int) (y + line));  
  
        // 第4行  
        line += heigth+3;   
         
  
        // 显示内容  
        for (int i = 0; i < orderList.size(); i++) {  
  
        	PageData orderpd = orderList.get(i);  
            g2.drawString(orderpd.getString("lunch_name")+"", (float) x, (float) y + line);  
//            g2.drawString(orderpd.get("sale_money").toString()+"", (float) x + 60, (float) y + line);  
            g2.drawString(orderpd.get("shop_number").toString()+"", (float) x + 84, (float) y + line);  
            g2.drawString(orderpd.get("allSaleMoney").toString()+"", (float) x + 100, (float) y + line);  
            line += heigth;  
  
        }  
        g2.drawLine((int) x, (int) (y + line), (int) x + 158, (int) (y + line));  
        line += heigth+3;  
//        g2.drawString("总量：" + allNumber + "件", (float) x, (float) y + line); 
        g2.drawString("合计：" + allMoney + "元", (float) x + 80, (float) y + line);  
        line += heigth+3;  
        font = new Font("宋体", Font.PLAIN, 12); 
        g2.drawString("联系姓名：" + name , (float) x, (float) y + line); 
        line += heigth+3;  
        g2.drawString("联系电话：" + phone , (float) x, (float) y + line); 
        line += heigth+3;  
        g2.drawString("时间：" + createTime, (float) x, (float) y + line); 
        line += heigth+3;  
        if(address.length() > 10){
        	g2.drawString("地址：" +address.substring(0, 10), (float) x, (float) y + line);  
        	 line += heigth+3; 
        	 g2.drawString(address.substring(10, address.length()), (float) x+ 24, (float) y + line);  
        }else{
        	g2.drawString("地址：" +address, (float) x , (float) y + line); 
        }
         line += heigth+3;  
         g2.drawString("九鱼便当,健康食品", (float) x + 20, (float) y + line); 
        line += heigth+3;   
         
        switch (pageIndex) {  
        case 0:  
  
            return PAGE_EXISTS;  
        default:  
            return NO_SUCH_PAGE;  
  
        }  
  
    }  
    
    /** 
     * 打印销售小票 
     *  
     * @param order 
     *            订单号 
     * @param num 
     *            数量 
     * @param sum 
     *            总金额 
     * @param practical 
     *            实收 
     * @param change 
     *            找零 
     */  
    public static void PrintSale() {  
        try {  
            // 通俗理解就是书、文档  
            Book book = new Book();  
            // 设置成竖打  
            PageFormat pf = new PageFormat();  
            pf.setOrientation(PageFormat.PORTRAIT);  
   
            // 通过Paper设置页面的空白边距和可打印区域。必须与实际打印纸张大小相符。  
            Paper paper = new Paper();  
            paper.setSize(158, 30000);// 纸张大小  
            paper.setImageableArea(0, 0, 158, 30000);// A4(595 X  
                                                        // 842)设置打印区域，其实0，0应该是72，72，因为A4纸的默认X,Y边距是72  
            pf.setPaper(paper);  
  
            book.append(new SalesTicket(), pf);  
  
            // 获取打印服务对象  
            PrinterJob job = PrinterJob.getPrinterJob();  
            // 设置打印类  
            job.setPageable(book);  
  
            job.print();  
        } catch (PrinterException e) {  
            e.printStackTrace();  
        }  
    }  
    
    
    public static void main(String[] args) {
    	PrintSale();
	}
  
} 