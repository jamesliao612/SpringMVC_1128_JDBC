package com.web.listener;

import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ApplicationData implements ServletContextListener {

    private static final Map menus = new LinkedHashMap();

    static {
        menus.put("discount_code.jsp", new String[]{"mvc/discount_code/input", "折扣碼"});
        menus.put("micro_market.jsp", new String[]{"mvc/micro_market/input", "市場區域"});
        menus.put("customer.jsp", new String[]{"mvc/customer/input", "客戶資料"});
        menus.put("manufacturer.jsp", new String[]{"mvc/manufacturer/input", "製造商"});
        menus.put("product_code.jsp", new String[]{"mvc/product_code/input", "產品代號"});
        menus.put("product.jsp", new String[]{"mvc/product/input", "產品資料"});
        menus.put("purchase_order.jsp", new String[]{"mvc/purchase_order/input", "訂單資料"});
        menus.put("pu_view.jsp", new String[]{"mvc/pu_view/all", "快速查詢"});
    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        event.getServletContext().setAttribute("menus", menus);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {

    }
}
