package com.sist.dao;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        int total = FoodDAO.foodTotalPage("한식");
        System.out.println(total);
	}

}
