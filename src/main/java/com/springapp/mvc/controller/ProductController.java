package com.springapp.mvc.controller;

import com.springapp.mvc.model.Product;
import com.springapp.mvc.repository.ProductRepository;
import com.springapp.mvc.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SaleRepository saleRepository;

    @ModelAttribute("product")
    public Product construct() {
        return new Product();
    }

    @RequestMapping("/createproduct")
    public String showCreateForm() {
        return "createproduct";
    }

    @RequestMapping(value="/createproduct", method= RequestMethod.POST)
    public String createProduct(@ModelAttribute("product") Product product, BindingResult result) {
        productRepository.save(product);
        return "redirect:/";
    }

    @RequestMapping("/")
    public String setupForm(ModelMap model){
        Product product = new Product();
        model.addAttribute("product", product);
        model.addAttribute("productList", productRepository.findAll());
        model.addAttribute("sales", saleRepository.findAll());
        return "product";
    }

    @RequestMapping(value="/product.do", method= RequestMethod.POST)
    public String doActions(@ModelAttribute Product product, BindingResult result, @RequestParam String action, Map<String, Object> map){
        Product productResult = new Product();
        String s = action.toLowerCase();
        if (s.equals("add")) {
            productRepository.save(product);
            productResult = product;

        } else if (s.equals("edit")) {
            productRepository.saveAndFlush(product);
            productResult = product;

        }
        map.put("product", productResult);
        map.put("productList", productRepository.findAll());
        return "product";
    }

}
