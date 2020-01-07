package com.web.mvc.repository.spec;

import com.web.mvc.entity.DiscountCode;
import java.util.List;

public interface DiscountCodeDao {
    // 相關 DiscountCode CRUD 方法簽章
    List<DiscountCode> queryDiscountCode();
    DiscountCode getDiscountCode(String code);
    void saveDiscountCode(DiscountCode dc);
    void updateDiscountCode(DiscountCode dc);
    void deleteDiscountCode(String code);
}
