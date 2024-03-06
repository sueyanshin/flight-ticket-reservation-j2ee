package com.entity;

import java.time.LocalDate;
import java.time.LocalTime;

public class Booking {
	private int id;
	private int flightId;
	private int userId;
	private String name;
	private String email;
	
//	private String source;
//	private String destination;
//	private String status;
//	private LocalDate departureDate;
//	private LocalTime departureTime;

	private double price;
	private int noOfSeats;
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Booking(int flightId, int userId, String name, String email, double price, int noOfSeats) {
		super();
		this.flightId = flightId;
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.price = price;
		this.noOfSeats = noOfSeats;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNoOfSeats() {
		return noOfSeats;
	}
	public void setNoOfSeats(int noOfSeats) {
		this.noOfSeats = noOfSeats;
	}
	
	
	

}
