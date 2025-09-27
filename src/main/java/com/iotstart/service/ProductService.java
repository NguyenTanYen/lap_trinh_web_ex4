package com.iotstart.service;

import java.util.List;

import com.iotstart.model.ProductDTO;

public interface ProductService {
	List<ProductDTO> getProductByName(String namString);
}
