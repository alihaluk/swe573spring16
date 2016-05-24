package com.bukoop.springservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by haluks on 28/04/16.
 */
@Controller
public class HomeController {

    @RequestMapping("/home")
    public String home() {
        return "index";
    }
}
