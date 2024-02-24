package com.entity;

public class City {
	private int id;
	private String cityName;

	public City() {
		super();
		// TODO Auto-generated constructor stub
	}

	public City(int id, String cityName) {
		super();
		this.id = id;
		this.cityName = cityName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

}
