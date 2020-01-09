package com.web.mvc.repository;

import com.web.mvc.entity.Customer;
import com.web.mvc.entity.DiscountCode;
import com.web.mvc.entity.Manufacturer;
import com.web.mvc.entity.MicroMarket;
import com.web.mvc.entity.Product;
import com.web.mvc.entity.ProductCode;
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
}
