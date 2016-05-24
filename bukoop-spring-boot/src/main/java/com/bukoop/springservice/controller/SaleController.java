package com.bukoop.springservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by haluks on 03/05/16.
 */
@Controller
public class SaleController {

    @RequestMapping("/sale")
    public String mainSale() {
        return "sale";
    }
}
