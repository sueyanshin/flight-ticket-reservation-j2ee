package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.entity.Flight;

public class FlightDao {
	private Connection conn;

	public FlightDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addFlight(Flight flight) {
		boolean f = false;

		try {

			String sql = "insert into flights(source,destination,status,departureDate,departureTime,ecoPrice,businessPrice,ecoSeats,businessSeats) values(?,?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);

			// change date
			LocalDate departureDate = flight.getDepartureDate();
			Date sqlDepartureDate = Date.valueOf(departureDate);

			// change time
			LocalTime departureDateTime = flight.getDepartureTime();
			Time sqlDepartureDateTime = Time.valueOf(departureDateTime);

			ps.setString(1, flight.getSource());
			ps.setString(2, flight.getDestination());
			ps.setString(3, flight.getStatus());
			ps.setDate(4, sqlDepartureDate);
			ps.setTime(5, sqlDepartureDateTime);
//			ps.setDouble(6, flight.getAdultPrice());
//			ps.setDouble(7, flight.getChildPrice());
//			ps.setDouble(8, flight.getInfantPrice());
			ps.setDouble(6, flight.getEcoPrice());
			ps.setDouble(7, flight.getBusinessPrice());
			ps.setInt(8, flight.getEcoSeats());
			ps.setInt(9, flight.getBusinessSeats());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Flight> getAllFlights() {
		List<Flight> list = new ArrayList<Flight>();
		Flight flight = null;
		try {

			String sql = "select * from flights order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				flight = new Flight();
				flight.setId(rs.getInt(1));
				flight.setSource(rs.getString(2));
				flight.setDestination(rs.getString(3));
				flight.setStatus(rs.getString(4));

				// Retrieve departureDate from ResultSet as java.sql.Date
				Date sqlDepartureDate = rs.getDate(5);
				// Convert java.sql.Date to LocalDate
				LocalDate departureDate = sqlDepartureDate.toLocalDate();
				// Set departureDate in Flight object
				flight.setDepartureDate(departureDate);

				// Retrieve departureTime from ResultSet as java.sql.Time
				Time sqlDepartureTime = rs.getTime(6);
				// Convert java.sql.Time to LocalTime
				LocalTime departureTime = sqlDepartureTime.toLocalTime();
				// Set departureTime in Flight object
				flight.setDepartureTime(departureTime);

//				flight.setAdultPrice(rs.getDouble(7));
//				flight.setChildPrice(rs.getDouble(8));
//				flight.setInfantPrice(rs.getDouble(9));
				flight.setEcoPrice(rs.getDouble(7));
				flight.setBusinessPrice(rs.getDouble(8));

				flight.setEcoSeats(rs.getInt(9));
				flight.setBusinessSeats(rs.getInt(10));

				list.add(flight);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Flight getAllFlightsById(int id) {

		Flight flight = null;
		try {

			String sql = "select * from flights where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				flight = new Flight();
				flight.setId(1);
				flight.setSource(rs.getString(2));
				flight.setDestination(rs.getString(3));
				flight.setStatus(rs.getString(4));

				Date sqlDepartureDate = rs.getDate(5);
				LocalDate departureDate = sqlDepartureDate.toLocalDate();
				flight.setDepartureDate(departureDate);

				Time sqlDepartureTime = rs.getTime(6);
				LocalTime departureTime = sqlDepartureTime.toLocalTime();
				flight.setDepartureTime(departureTime);

				flight.setEcoPrice(rs.getDouble(7));
				flight.setBusinessPrice(rs.getDouble(8));

				flight.setEcoSeats(rs.getInt(9));
				flight.setBusinessSeats(rs.getInt(10));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flight;
	}

	public Flight searchFlight(String source, String destination, LocalDate departureDate) {

		Flight flight = null;
		try {

			String sql = "select * from flights where source=? and destination=? and departureDate=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, source);
			ps.setString(2, destination);
			ps.setDate(3, java.sql.Date.valueOf(departureDate));

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				flight = new Flight();
				flight.setId(rs.getInt(1));
				flight.setSource(rs.getString(2));
				flight.setDestination(rs.getString(3));
				flight.setStatus(rs.getString(4));

				Date sqlDepartureDate = rs.getDate(5);
				LocalDate departureDateResult = sqlDepartureDate.toLocalDate();
				flight.setDepartureDate(departureDateResult);

				Time sqlDepartureTime = rs.getTime(6);
				LocalTime departureTime = sqlDepartureTime.toLocalTime();
				flight.setDepartureTime(departureTime);

				flight.setEcoPrice(rs.getDouble(7));
				flight.setBusinessPrice(rs.getDouble(8));

				flight.setEcoSeats(rs.getInt(9));
				flight.setBusinessSeats(rs.getInt(10));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flight;
	}

	public boolean updateFlight(Flight flight) {
		boolean f = false;

		try {

			String sql = "update flights set source=?,destination=?,status=?,departureDate=?,departureTime=?,ecoPrice=?,businessPrice=?,ecoSeats=?,businessSeats=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			// change date
			LocalDate departureDate = flight.getDepartureDate();
			Date sqlDepartureDate = Date.valueOf(departureDate);

			// change time
			LocalTime departureDateTime = flight.getDepartureTime();
			Time sqlDepartureDateTime = Time.valueOf(departureDateTime);

			ps.setString(1, flight.getSource());
			ps.setString(2, flight.getDestination());
			ps.setString(3, flight.getStatus());
			ps.setDate(4, sqlDepartureDate);
			ps.setTime(5, sqlDepartureDateTime);
//			ps.setDouble(6, flight.getAdultPrice());
//			ps.setDouble(7, flight.getChildPrice());
//			ps.setDouble(8, flight.getInfantPrice());
			ps.setDouble(6, flight.getEcoPrice());
			ps.setDouble(7, flight.getBusinessPrice());
			ps.setInt(8, flight.getEcoSeats());
			ps.setInt(9, flight.getBusinessSeats());
			ps.setInt(10, flight.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteFlight(int id) {
		boolean f = false;
		try {

			String sql = "delete from flights where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public int getFlightCount() {
		int count = 0;
		String sql = "select count(*) as count from flights";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

}
