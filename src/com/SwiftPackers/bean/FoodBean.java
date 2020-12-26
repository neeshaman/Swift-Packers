package com.SwiftPackers.bean;

public class FoodBean {
	private String foodId, foodType;

	public FoodBean() {}
	public FoodBean(String foodId, String foodType) {
		super();
		this.foodId = foodId;
		this.foodType = foodType;
	}

	public String getFoodId() {
		return foodId;
	}

	
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
}
