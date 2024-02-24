package com.entity;

import java.time.*;

public class Flight {
	private int id;
	private String source;
	private String destination;
	private String status;
	private LocalDate departureDate;
	private LocalTime departureTime;
//	private double adultPrice;
//	private double childPrice;
//	private double infantPrice;
	private double ecoPrice;
	private double businessPrice;
	private int ecoSeats;
	private int businessSeats;

	public Flight() {
		super();
		// destinationDO Audestination-generated construcdestinationr stub
	}

	public Flight(String source, String destination, String status, LocalDate departureDate, LocalTime departureTime,
			double ecoPrice, double businessPrice, int ecoSeats, int businessSeats) {
		super();

		this.source = source;
		this.destination = destination;
		this.status = status;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
//		this.adultPrice = adultPrice;
//		this.childPrice = childPrice;
//		this.infantPrice = infantPrice;
		this.ecoPrice = ecoPrice;
		this.businessPrice = businessPrice;
		this.ecoSeats = ecoSeats;
		this.businessSeats = businessSeats;
	}

	public Flight(int id, String source, String destination, String status, LocalDate departureDate,
			LocalTime departureTime, double ecoPrice, double businessPrice, int ecoSeats, int businessSeats) {
		super();
		this.id = id;
		this.source = source;
		this.destination = destination;
		this.status = status;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.ecoPrice = ecoPrice;
		this.businessPrice = businessPrice;
		this.ecoSeats = ecoSeats;
		this.businessSeats = businessSeats;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDate getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(LocalDate date) {
		this.departureDate = date;
	}

	public LocalTime getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(LocalTime time) {
		this.departureTime = time;
	}
//
//	public double getAdultPrice() {
//		return adultPrice;
//	}
//
//	public void setAdultPrice(double adultPrice) {
//		this.adultPrice = adultPrice;
//	}
//
//	public double getChildPrice() {
//		return childPrice;
//	}
//
//	public void setChildPrice(double childPrice) {
//		this.childPrice = childPrice;
//	}
//
//	public double getInfantPrice() {
//		return infantPrice;
//	}
//
//	public void setInfantPrice(double infantPrice) {
//		this.infantPrice = infantPrice;
//	}

	public double getEcoPrice() {
		return ecoPrice;
	}

	public void setEcoPrice(double ecoPrice) {
		this.ecoPrice = ecoPrice;
	}

	public double getBusinessPrice() {
		return businessPrice;
	}

	public void setBusinessPrice(double businessPrice) {
		this.businessPrice = businessPrice;
	}

	public int getEcoSeats() {
		return ecoSeats;
	}

	public void setEcoSeats(int ecoSeats) {
		this.ecoSeats = ecoSeats;
	}

	public int getBusinessSeats() {
		return businessSeats;
	}

	public void setBusinessSeats(int businessSeats) {
		this.businessSeats = businessSeats;
	}

}
