package com.example.hello_world.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("saudacao")
public class SaudacaoController {


    @GetMapping()
    public String getSaudacao() {
        return "Hello, World!";
    }


}
