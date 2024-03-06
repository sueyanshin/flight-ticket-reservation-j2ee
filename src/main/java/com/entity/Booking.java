package com.entity;

import java.time.LocalDate;
import java.time.LocalTime;


public class Booking {
	private int id;
	private int userId;
	private String name;
	private String email;

	private int flightId;
	private String source;
	private String destination;
	private LocalDate departureDate;
	private LocalTime departureTime;
	private double totalPrice;
	private String ticketStatus;
	private int noOfSeats;
//	private FileInputStream image;
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
public Booking(int userId, String name, String email, int flightId, String source, String destination,
		LocalDate departureDate, LocalTime departureTime,double totalPrice,  String ticketStatus, int noOfSeats) {
	super();
	this.userId = userId;
	this.name = name;
	this.email = email;
	this.flightId = flightId;
	this.source = source;
	this.destination = destination;
	this.departureDate = departureDate;
	this.departureTime = departureTime;
	this.totalPrice = totalPrice;
	this.ticketStatus = ticketStatus;
	this.noOfSeats = noOfSeats;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public int getFlightId() {
	return flightId;
}
public void setFlightId(int flightId) {
	this.flightId = flightId;
}
public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}
public String getDestination() {
	return destination;
}
public void setDestination(String destination) {
	this.destination = destination;
}
public LocalDate getDepartureDate() {
	return departureDate;
}
public void setDepartureDate(LocalDate departureDate) {
	this.departureDate = departureDate;
}
public LocalTime getDepartureTime() {
	return departureTime;
}
public void setDepartureTime(LocalTime departureTime) {
	this.departureTime = departureTime;
}
public String getTicketStatus() {
	return ticketStatus;
}
public void setTicketStatus(String ticketStatus) {
	this.ticketStatus = ticketStatus;
}
public double getTotalPrice() {
	return totalPrice;
}
public void setTotalPrice(double totalPrice) {
	this.totalPrice = totalPrice;
}
public int getNoOfSeats() {
	return noOfSeats;
}
public void setNoOfSeats(int noOfSeats) {
	this.noOfSeats = noOfSeats;
}

}
