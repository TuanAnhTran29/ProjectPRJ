/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Food {
    private int foodID;
    private String foodName;
    private double price;
    private String categoryName;
    private String brandName;
    private String description;

    public Food(int foodID, String foodName, double price, String categoryName, String brandName,String description) {
        this.foodID = foodID;
        this.foodName = foodName;
        this.price = price;
        this.categoryName = categoryName;
        this.brandName = brandName;
        this.description= description;
    }

    public Food(String foodName, double price, String categoryName, String brandName, String description) {
        this.foodName = foodName;
        this.price = price;
        this.categoryName = categoryName;
        this.brandName = brandName;
        this.description= description;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    

    @Override
    public String toString() {
        return "Food{" + "foodID=" + foodID + ", foodName=" + foodName + ", price=" + price + ", categoryName=" + categoryName + ", brandName=" + brandName + '}';
    }
    
    
}
