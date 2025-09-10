package vn.iostar.services.impl;

import java.util.List;

import vn.iostar.dao.ICategoryDao;
import vn.iostar.dao.impl.CategoryDaoImpl;
import vn.iostar.models.CategoryModel;
import vn.iostar.services.ICategoryService;

public class CategoryServiceImpl implements ICategoryService{
	ICategoryDao categoryDao = new CategoryDaoImpl();

	@Override
	public List<CategoryModel> findAll() {
		return categoryDao.findAll();
	}

	@Override
	public CategoryModel findById(int id) {
		return categoryDao.findById(id);
	}

	@Override
	public void insert(CategoryModel category) {
		categoryDao.insert(category);
	}

	@Override
	public void update(CategoryModel category) {
		categoryDao.update(category);
	}

	@Override
	public void delete(int id) {
		categoryDao.delete(id);
	}

	@Override
	public List<CategoryModel> findByCategoryName(String keyword) {
		return categoryDao.findByCategoryName(keyword);
	}

}
