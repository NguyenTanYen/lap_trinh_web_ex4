package vn.iostar.models;

import java.io.Serializable;

public class CategoryModel implements Serializable{

	private static final long serialVersionUID = 1L;
	private int categoryId;
	private String categoryName;
	private String image;
	private int active;

	public CategoryModel() {
		super();
	}
	public CategoryModel(int categoryId, String categoryName, String image, int active) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.image = image;
		this.active	= active;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "CategoryModel [categoryId=" + categoryId + ", categoryName=" + categoryName + ", image=" + image
				+ ", active=" + active + "]";
	}
}
