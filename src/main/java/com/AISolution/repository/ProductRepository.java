package com.AISolution.repository;

import java.util.List;

import com.AISolution.repository.entity.ProductEntity;
/*

+ Interface trong Java chủ yếu được dùng để khai báo (contract)
+ còn việc thực hiện (implementation) thì do class khác làm.

*/
public interface ProductRepository { 
	List<ProductEntity> getProductByName(String namString);
	
}
