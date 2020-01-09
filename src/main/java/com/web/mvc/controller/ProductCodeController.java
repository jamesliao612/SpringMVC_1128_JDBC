package com.web.mvc.controller;

import com.web.mvc.entity.ProductCode;
import com.web.mvc.repository.spec.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product_code")
public class ProductCodeController {
    
    @Autowired
    @Qualifier("productDao")
    private ProductDao productDao;
    
    @GetMapping("/input")
    public String input(Model model){
        model.addAttribute("po", new ProductCode());
        model.addAttribute("queryResult", productDao.queryProductCode());
        model.addAttribute("_method", "POST");
        return "product_code";
    }
    
    @GetMapping("/{code}")
    public String get(@PathVariable("code")String code,Model model){
        model.addAttribute("po", productDao.getProductCode(code));
        model.addAttribute("queryResult", productDao.queryProductCode());
        model.addAttribute("_method", "PUT");
        model.addAttribute("readonly", "TRUE");
        return "product_code";
    }
    
    @PostMapping("/")
    public String save(@ModelAttribute ProductCode pc){
        productDao.saveProductCode(pc);
        return "redirect: ./input";
    }
    
    @PutMapping("/")
    public String update(@ModelAttribute ProductCode pc){
        productDao.updateProductCode(pc);
        return "redirect: ./input";
    }
    
    @DeleteMapping("/{code}")
    public String delete(@PathVariable("code")String code){
        productDao.deleteProductCode(code);
        return "redirect: ./input";
    }
}
