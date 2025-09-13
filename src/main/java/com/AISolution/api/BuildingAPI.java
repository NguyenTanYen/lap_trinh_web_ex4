package com.AISolution.api;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.AISolution.model.ProductDTO;
import com.AISolution.service.impl.ProductServiceImpl;

@RestController
public class BuildingAPI {

    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/api/login/")
    public List<ProductDTO> loginPage(
            @RequestParam(name = "nameOfProduct", required = false, defaultValue = "") String name) {
        return productService.getProductByName(name);
    }
}
