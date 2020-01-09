package com.web.mvc.repository;

import com.web.mvc.entity.Customer;
import com.web.mvc.entity.DiscountCode;
import com.web.mvc.entity.Manufacturer;
import com.web.mvc.entity.MicroMarket;
import com.web.mvc.entity.PUView;
import com.web.mvc.entity.Product;
import com.web.mvc.entity.ProductCode;
import com.web.mvc.entity.PurchaseOrder;
import org.springframework.jdbc.core.RowMapper;

public class RowMap {
    
    static RowMapper<DiscountCode> discountCode = (rs, i) -> {
        DiscountCode dc = new DiscountCode();
        dc.setDiscountCode(rs.getString("DISCOUNT_CODE"));
        dc.setRate(rs.getDouble("RATE"));
        return dc;
    };
    
    static RowMapper<MicroMarket> microMarket = (rs, i) -> {
        MicroMarket mm = new MicroMarket();
        mm.setZipCode(rs.getString("ZIP_CODE"));
        mm.setRadius(rs.getDouble("RADIUS"));
        mm.setAreaLength(rs.getDouble("AREA_LENGTH"));
        mm.setAreaWidth(rs.getDouble("AREA_WIDTH"));
        return mm;
    };
    
    static RowMapper<Customer> customers = (rs, i) -> {
        Customer customer = new Customer();
        customer.setCustomerId(rs.getInt("CUSTOMER_ID"));
        customer.setDiscountCode(rs.getString("DISCOUNT_CODE"));
        customer.setZip(rs.getString("ZIP"));
        customer.setName(rs.getString("NAME"));
        customer.setAddressLine1(rs.getString("ADDRESSLINE1"));
        customer.setAddressLine2(rs.getString("ADDRESSLINE2"));
        customer.setCity(rs.getString("CITY"));
        customer.setState(rs.getString("STATE"));
        customer.setPhone(rs.getString("PHONE"));
        customer.setFax(rs.getString("FAX"));
        customer.setEmail(rs.getString("EMAIL"));
        customer.setCreditLimit(rs.getInt("CREDIT_LIMIT"));
        return customer;
    };
    
    static RowMapper<Manufacturer> mfs = (rs, i) -> {
        Manufacturer mf = new Manufacturer();
        mf.setManufacturerId(rs.getInt("MANUFACTURER_ID"));
        mf.setName(rs.getString("NAME"));
        mf.setAddressline1(rs.getString("ADDRESSLINE1"));
        mf.setAddressline2(rs.getString("ADDRESSLINE2"));
        mf.setCity(rs.getString("CITY"));
        mf.setState(rs.getString("STATE"));
        mf.setZip(rs.getString("ZIP"));
        mf.setPhone(rs.getString("PHONE"));
        mf.setFax(rs.getString("FAX"));
        mf.setEmail(rs.getString("EMAIL"));
        mf.setRep(rs.getString("REP"));
        return mf;
    };
    
    static RowMapper<ProductCode> pcs = (rs, i) -> {
        ProductCode pc = new ProductCode();
        pc.setProdCode(rs.getString("PROD_CODE"));
        pc.setDiscountCode(rs.getString("DISCOUNT_CODE"));
        pc.setDescription(rs.getString("DESCRIPTION"));
        return pc;
    };
    
    static RowMapper<Product> products = (rs, i) -> {
        Product product = new Product();
        product.setProductId(rs.getInt("PRODUCT_ID"));
        product.setManufacturerId(rs.getInt("MANUFACTURER_ID"));
        product.setProductCode(rs.getString("PRODUCT_CODE"));
        product.setPurchaseCost(rs.getDouble("PURCHASE_COST"));
        product.setQuantityOnHand(rs.getInt("QUANTITY_ON_HAND"));
        product.setMarkup(rs.getDouble("MARKUP"));
        product.setAvailable(rs.getBoolean("AVAILABLE"));
        product.setDescription(rs.getString("DESCRIPTION"));
        return product;
    };
    
    static RowMapper<PurchaseOrder> pos = (rs, i) -> {
        PurchaseOrder po = new PurchaseOrder();
        po.setOrderNum(rs.getInt("ORDER_NUM"));
        po.setCustomerId(rs.getInt("CUSTOMER_ID"));
        po.setProductId(rs.getInt("PRODUCT_ID"));
        po.setQuantity(rs.getInt("QUANTITY"));
        po.setShippingCost(rs.getDouble("SHIPPING_COST"));
        //若資料庫日期型態非Date型別 則需轉型
        //利用SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //Example po.setSalesDate(sdf.parse(rs.getDate("SALES_DATE")));
        //同理，修改資料庫時需注意存入資料之型別一致性 save、update
        po.setSalesDate(rs.getDate("SALES_DATE"));
        po.setShippingDate(rs.getDate("SHIPPING_DATE"));
        po.setFreightCompany(rs.getString("FREIGHT_COMPANY"));
        return po;
    };
    
    static RowMapper<PUView> pvs = (rs, i) -> {
        PUView pv = new PUView();
        pv.setOrderNum(rs.getInt("ORDER_NUM"));
        pv.setCustomerId(rs.getInt("CUSTOMER_ID"));
        pv.setCustomerName(rs.getString("CUSTOMER_NAME"));
        pv.setProductId(rs.getInt("PRODUCT_ID"));
        pv.setProductName(rs.getString("PRODUCT_NAME"));
        pv.setProductCodeName(rs.getString("PRODUCT_CODE_NAME"));
        pv.setQuantity(rs.getInt("QUANTITY"));
        pv.setPurchaseCost(rs.getDouble("PURCHASE_COST"));
        pv.setRate(rs.getDouble("RATE"));
        pv.setSubtotal(rs.getDouble("SUBTOTAL"));
        return pv;
    };
}
