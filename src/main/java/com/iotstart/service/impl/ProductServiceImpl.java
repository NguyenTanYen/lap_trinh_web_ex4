package com.iotstart.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iotstart.model.ProductDTO;
import com.iotstart.repository.ProductRepository;
import com.iotstart.repository.entity.ProductEntity;
import com.iotstart.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductRepository productReposity; // Spring tìm Bean ProductRepository và tiêm vào đây
	
	@Override
	public List<ProductDTO> getProductByName(String name) {
		// TODO Auto-generated method stub
		List<ProductEntity> productEntities = productReposity.getProductByName(name);
		List<ProductDTO> result = new ArrayList<>();
		for (ProductEntity item : productEntities) {
			ProductDTO curProduct = new ProductDTO();
			curProduct.setProductName(item.getProductName());
			curProduct.setPrice(item.getPrice());
			curProduct.setStock(item.getStock());
			result.add(curProduct);
		}
		return result;
	}
	
}
