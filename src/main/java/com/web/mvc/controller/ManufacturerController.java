package com.web.mvc.controller;

import com.web.mvc.entity.Manufacturer;
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
@RequestMapping("/manufacturer")
public class ManufacturerController extends BaseController{
    
    @Autowired
    @Qualifier("productDao")
    private ProductDao productDao;
    
    @GetMapping("/input")
    public String input(Model model){
        model.addAttribute("po", new Manufacturer());
        model.addAttribute("queryResult", productDao.queryManufacturer());
        model.addAttribute("_method", "POST");
        return "manufacturer";
    }
    
    @GetMapping("/{id}")
    public String get(@PathVariable("id")Integer id,Model model){
        model.addAttribute("po", productDao.getManufacturer(id));
        model.addAttribute("queryResult", productDao.queryManufacturer());
        model.addAttribute("_method", "PUT");
        model.addAttribute("readonly", "TRUE");
        return "manufacturer";
    }
    
    @PostMapping("/")
    public String save(@ModelAttribute Manufacturer mf){
        productDao.saveManufacturer(mf);
        return "redirect: ./input";
    }
    
    @PutMapping("/")
    public String update(@ModelAttribute Manufacturer mf){
        productDao.updateManufacturer(mf);
        return "redirect: ./input";
    }
    
    @DeleteMapping("/{id}")
    public String delete(@PathVariable("id")Integer id){
        productDao.deleteManufacturer(id);
        return "redirect: ./input";
    }
}
