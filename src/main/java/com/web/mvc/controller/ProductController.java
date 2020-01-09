package com.web.mvc.controller;

import com.web.mvc.entity.Product;
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
@RequestMapping("/product")
public class ProductController extends BaseController{

    @Autowired
    @Qualifier("productDao")
    private ProductDao productDao;

    @GetMapping("/input")
    public String input(Model model) {
        model.addAttribute("po", new Product());
        model.addAttribute("queryResult", productDao.queryProduct());
        model.addAttribute("mfList", productDao.queryManufacturer());
        model.addAttribute("pcList", productDao.queryProductCode());
        model.addAttribute("_method", "POST");
        return "product";
    }

    @GetMapping("/{id}")
    public String get(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("po", productDao.getProduct(id));
        model.addAttribute("queryResult", productDao.queryProduct());
        model.addAttribute("mfList", productDao.queryManufacturer());
        model.addAttribute("pcList", productDao.queryProductCode());
        model.addAttribute("_method", "PUT");
        model.addAttribute("readonly", "TRUE");
        return "product";
    }

    @PostMapping("/")
    public String save(@ModelAttribute Product p) {
        productDao.saveProduct(p);
        return "redirect: ./input";
    }

    @PutMapping("/")
    public String update(@ModelAttribute Product p) {
        productDao.updateProduct(p);
        return "redirect: ./input";
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable("id") Integer id) {
        productDao.deleteProduct(id);
        return "redirect: ./input";
    }

}
