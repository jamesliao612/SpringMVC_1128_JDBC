package com.web.mvc.validator;

import com.web.mvc.entity.PurchaseOrder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class PurchaseOrderValidator implements Validator{

    @Override
    public boolean supports(Class<?> clas) {
        return PurchaseOrder.class.isAssignableFrom(clas);
    }

    @Override
    public void validate(Object object, Errors errors) {
        PurchaseOrder po = (PurchaseOrder)object;
        
        if(po.getOrderNum() == null || po.getOrderNum() <= 0){
            errors.rejectValue("orderNum", "purchaseOrder.orderNum.invalid");
        }
        
        if(po.getQuantity()== null || po.getQuantity() <= 0){
            errors.rejectValue("quantity", "purchaseOrder.quantity.invalid");
        }
        
        if(po.getShippingCost()== null || po.getShippingCost() < 10){
            errors.rejectValue("shippingCost", "purchaseOrder.shippingCost.invalid");
        }
    }
    
}
