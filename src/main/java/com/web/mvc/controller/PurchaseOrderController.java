package com.web.mvc.controller;

import com.web.mvc.entity.PurchaseOrder;
import com.web.mvc.repository.spec.CustomerDao;
import com.web.mvc.repository.spec.ProductDao;
import com.web.mvc.repository.spec.PurchaseOrderDao;
import com.web.mvc.validator.PurchaseOrderValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase_order")
public class PurchaseOrderController extends BaseController{

    @Autowired
    @Qualifier("purchaseOrderDao")
    private PurchaseOrderDao purDao;

    @Autowired
    @Qualifier("customerDao")
    private CustomerDao cusDao;

    @Autowired
    @Qualifier("productDao")
    private ProductDao proDao;

    @Autowired
    private PurchaseOrderValidator validator;

    @GetMapping("/input")
    public String input(Model model) {
        model.addAttribute("purchaseOrder", new PurchaseOrder());
        model.addAttribute("purchaseOrderList", purDao.queryPurchaseOrder());
        model.addAttribute("cusList", cusDao.queryCustomer());
        model.addAttribute("proList", proDao.queryProduct());
        model.addAttribute("_method", "POST");
        return "purchase_order";
    }

    @GetMapping("/{num}")
    public String get(@PathVariable("num") Integer num, Model model) {
        model.addAttribute("purchaseOrder", purDao.getPurchaseOrder(num));
        model.addAttribute("purchaseOrderList", purDao.queryPurchaseOrder());
        model.addAttribute("cusList", cusDao.queryCustomer());
        model.addAttribute("proList", proDao.queryProduct());
        model.addAttribute("readonly", "TRUE");
        model.addAttribute("_method", "PUT");
        return "purchase_order";
    }

    @PostMapping("/")
    public String save(@ModelAttribute PurchaseOrder po, BindingResult br, Model model) {
        this.validator.validate(po, br);
        if (br.hasErrors()) {
            model.addAttribute("purchaseOrderList", purDao.queryPurchaseOrder());
            model.addAttribute("cusList", cusDao.queryCustomer());
            model.addAttribute("proList", proDao.queryProduct());
            model.addAttribute("_method", "POST");
            return "purchase_order";
        }

        purDao.savePurchaseOrder(po);
        return "redirect: ./input";
    }

    @PutMapping("/")
    public String update(@ModelAttribute PurchaseOrder po) {
        purDao.updatePurchaseOrder(po);
        return "redirect: ./input";
    }

    @DeleteMapping("/{num}")
    public String delete(@PathVariable("num") Integer num) {
        purDao.deletePurchaseOrder(num);
        return "redirect: ./input";
    }
}
