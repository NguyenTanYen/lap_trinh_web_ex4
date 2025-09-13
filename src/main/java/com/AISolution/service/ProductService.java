package com.AISolution.service;

import java.util.List;

import com.AISolution.model.ProductDTO;

public interface ProductService {
	List<ProductDTO> getProductByName(String namString);
}
