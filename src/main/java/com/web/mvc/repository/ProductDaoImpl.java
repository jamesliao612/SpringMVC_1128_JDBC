package com.web.mvc.repository;

import com.web.mvc.entity.Manufacturer;
import com.web.mvc.entity.Product;
import com.web.mvc.entity.ProductCode;
import com.web.mvc.repository.spec.ProductDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "productDao")
public class ProductDaoImpl implements ProductDao{
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Product> queryProduct() {
        String sql = "SELECT * FROM PRODUCT";
        return jdbcTemplate.query(sql, RowMap.products);
    }

    @Override
    public Product getProduct(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void saveProduct(Product p) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateProduct(Product p) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteProduct(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Manufacturer> queryManufacturer() {
        String sql = "SELECT * FROM MANUFACTURER";
        return jdbcTemplate.query(sql, RowMap.mf);
    }

    @Override
    public Manufacturer getManufacturer(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void saveManufacturer(Manufacturer mf) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateManufacturer(Manufacturer mf) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteManufacturer(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProductCode> queryProductCode() {
        String sql = "SELECT * FROM PRODUCT_CODE";
        return jdbcTemplate.query(sql, RowMap.pc);
    }

    @Override
    public ProductCode getProductCode(String code) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void saveProductCode(ProductCode pc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateProductCode(ProductCode pc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteProductCode(String code) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
