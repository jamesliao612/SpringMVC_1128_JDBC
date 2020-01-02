package com.web.mvc.repository.spec;

import com.web.mvc.entity.Customer;
import java.util.List;

public interface CustomerDao extends DiscountCodeDao,MicroMarketDao{
    // 相關 Customer CRUD 方法簽章
    List<Customer> queryCustomer();
}
