package com.web.mvc.repository;

import com.web.mvc.entity.Customer;
import com.web.mvc.entity.DiscountCode;
import com.web.mvc.entity.MicroMarket;
import com.web.mvc.repository.spec.CustomerDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "customerDao")
public class CustomerDaoImpl implements CustomerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Customer> queryCustomer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<DiscountCode> queryDiscountCode() {
        String sql = "SELECT * FROM DISCOUNT_CODE";
        return jdbcTemplate.query(sql, RowMap.discountCode);
    }

    @Override
    public DiscountCode getDiscountCode(String code) {
        String sql = "SELECT * FROM DISCOUNT_CODE WHERE DISCOUNT_CODE = ?";
        DiscountCode dc = jdbcTemplate.queryForObject(sql, new Object[]{code}, RowMap.discountCode);
        return dc;
    }

    @Override
    public void saveDiscountCode(DiscountCode dc) {
        String sql = "INSERT INTO DISCOUNT_CODE(DISCOUNT_CODE, RATE) VALUES(?, ?)";
        jdbcTemplate.update(sql, dc.getDiscountCode(), dc.getRate());
    }

    @Override
    public void updateDiscountCode(DiscountCode dc) {
        String sql = "UPDATE DISCOUNT_CODE SET RATE = ? WHERE DISCOUNT_CODE = ?";
        jdbcTemplate.update(sql, dc.getRate(), dc.getDiscountCode());
    }

    @Override
    public void deletetDiscountCode(String code) {
        String sql = "DELETE FROM DISCOUNT_CODE WHERE DISCOUNT_CODE = ?";
        jdbcTemplate.update(sql, code);
    }

    @Override
    public List<MicroMarket> queryMicroMarket() {
        String sql = "SELECT * FROM MICRO_MARKET";
        return jdbcTemplate.query(sql, RowMap.microMarket);
    }
    
    @Override
    public MicroMarket getMicroMarket(String code) {
        String sql = "SELECT * FROM MICRO_MARKET WHERE ZIP_CODE = ?";
        MicroMarket mm = jdbcTemplate.queryForObject(sql, new Object[]{code}, RowMap.microMarket);
        return mm;
    }
    
    @Override
    public void saveMicroMarket(MicroMarket mm) {
        String sql = "INSERT INTO "
                + "MICRO_MARKET(ZIP_CODE, RADIUS, AREA_LENGTH, AREA_WIDTH) "
                + "VALUES(?, ?, ?, ?)";
        jdbcTemplate.update(sql, mm.getZipCode(),mm.getRadius(),mm.getAreaLength(),mm.getAreaWidth());
    }
    
    @Override
    public void updateMicroMarket(MicroMarket mm) {
            String sql = "UPDATE MICRO_MARKET"
                    + " SET RADIUS = ?, AREA_LENGTH = ?, AREA_WIDTH = ?"
                    + " WHERE ZIP_CODE = ?";
        jdbcTemplate.update(sql, mm.getRadius(),mm.getAreaLength(),mm.getAreaWidth(),mm.getZipCode());
    }
    
    @Override
    public void deleteMicroMarket(String code) {
        String sql = "DELETE FROM MICRO_MARKET WHERE ZIP_CODE = ?";
        jdbcTemplate.update(sql, code);
    }
}
