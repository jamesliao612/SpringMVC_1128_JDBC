package com.web.mvc.controller;

import com.web.mvc.repository.spec.PUViewDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pu_view")
public class PUViewController {
    
    @Autowired
    @Qualifier("puViewDao")
    private PUViewDao dao;
    
    @GetMapping("/all")
    public String queryAll(Model model){
        model.addAttribute("queryResult", dao.queryPUView());
        return "pu_view";
    }
}
