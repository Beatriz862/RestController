package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConversorTemperaturaController {

    // Converter Celsius para Fahrenheit
    @GetMapping("/celsiusParaFahrenheit")
    public double celsiusParaFahrenheit(@RequestParam("grau") double grau) {
        return (grau * 9 / 5) + 32;
    }

    // Converter Fahrenheit para Celsius
    @GetMapping("/fahrenheitParaCelsius")
    public double fahrenheitParaCelsius(@RequestParam("grau") double grau) {
        return (grau - 32) * 5 / 9;
    }
}