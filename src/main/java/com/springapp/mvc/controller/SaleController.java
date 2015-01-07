package com.springapp.mvc.controller;

import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.Sale;
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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SaleController {

    @Autowired
    private SaleRepository saleRepository;

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value="/createsale", method = RequestMethod.GET)
    public String showCreateForm(ModelMap model) {
        model.addAttribute("sale", new Sale());
        model.addAttribute("products", productRepository.findAll());
        return "createsale";
    }

    @RequestMapping(value="/createsale", method= RequestMethod.POST)
    public String createSale(@ModelAttribute("sale") Sale sale,
                             @ModelAttribute("product") Product productFromForm,
                             BindingResult result) {
        List<Product> productList = new ArrayList<Product>();
        productList.add(productFromForm);
        sale.setProductList(productList);
        sale.setDate(new Date());
        saleRepository.save(sale);
        return "redirect:/sale";
    }

    @RequestMapping("/sale")
    public String setupForm(ModelMap model){
        Sale sale = new Sale();
        model.addAttribute("sale", sale);
        model.addAttribute("saleList", saleRepository.findAll());
        model.addAttribute("products", productRepository.findAll());
        return "sale";
    }

    @RequestMapping(value="/sale.do", method= RequestMethod.POST)
    public String doActions(@ModelAttribute Sale sale, BindingResult result, @RequestParam String action, ModelMap model){
        Sale saleResult = new Sale();
        String s = action.toLowerCase();
        if (s.equals("add")) {
            saleRepository.save(sale);
            saleResult = sale;
        } else if (s.equals("edit")) {
            sale.setDate(new Date());
            saleRepository.saveAndFlush(sale);
            saleResult = sale;

        }

        model.addAttribute("sale", saleResult);
        model.addAttribute("saleList", saleRepository.findAll());
        return "sale";
    }

//    class ProductEditor extends PropertyEditorSupport {
//
//        @Override
//        public void setAsText(String text){
//            Long id = Long.parseLong(text);
//            Product product = productRepository.findOne(id);
//            setValue(product);
//        }
//    }
//
//    @InitBinder
//    protected void initBinder(WebDataBinder binder) {
//        binder.registerCustomEditor(Product.class, new ProductEditor());
//    }

}
