package com.web.mvc.controller;

import com.web.mvc.entity.MicroMarket;
import com.web.mvc.repository.spec.CustomerDao;
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
@RequestMapping("/micro_market")
public class MicroMarketController {
    
    @Autowired
    @Qualifier("customerDao")
    private CustomerDao customerDao;
    
    @GetMapping("/input")
    public String input(Model model){     
        model.addAttribute("po", new MicroMarket());
        model.addAttribute("queryResult", customerDao.queryMicroMarket());
        model.addAttribute("_method", "POST");
        return "micro_market";
    }
    
    @GetMapping("/{code}")
    public String get(@PathVariable("code")String code,Model model){     
        MicroMarket mm = customerDao.getMicroMarket(code);
        model.addAttribute("po", mm);
        model.addAttribute("queryResult", customerDao.queryMicroMarket());
        model.addAttribute("readonly", "TRUE");
        model.addAttribute("_method", "PUT");
        return "micro_market";
    }
    
    @PostMapping("/")
    public String save(@ModelAttribute MicroMarket mm){     
        customerDao.saveMicroMarket(mm);
        return "redirect: ./input";
    }
    
    @PutMapping("/")
    public String update(@ModelAttribute MicroMarket mm){     
        customerDao.updateMicroMarket(mm);
        return "redirect: ./input";
    }
    
    @DeleteMapping("/{code}")
    public String delete(@PathVariable("code")String code){     
        customerDao.deleteMicroMarket(code);
        return "redirect: ./input";
    }
}
