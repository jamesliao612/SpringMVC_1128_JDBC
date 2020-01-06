package com.web.mvc.repository.spec;

import com.web.mvc.entity.MicroMarket;
import java.util.List;

public interface MicroMarketDao {
    // 相關 MicroMarket CRUD 方法簽章
    List<MicroMarket> queryMicroMarket();
    MicroMarket getMicroMarket(String code);
    void saveMicroMarket(MicroMarket mm);
    void updateMicroMarket(MicroMarket mm);
    void deleteMicroMarket(String code);
}
