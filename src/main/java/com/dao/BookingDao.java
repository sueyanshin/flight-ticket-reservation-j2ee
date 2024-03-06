package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import com.entity.Booking;

public class BookingDao {
	private Connection conn;

	public BookingDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean bookAFlight(Booking book) {
		boolean f=false;
		
		try {
			String sql="insert into booking(user_id,name,email,flight_id,source,destination,departure_date,departure_time,total_price,ticket_status,no_of_seats) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			// change date
			LocalDate departureDate = book.getDepartureDate();
			Date sqlDepartureDate = Date.valueOf(departureDate);

			// change time
			LocalTime departureDateTime = book.getDepartureTime();
			Time sqlDepartureDateTime = Time.valueOf(departureDateTime);

			
			ps.setInt(1, book.getUserId());
			ps.setString(2, book.getName());
			ps.setString(3, book.getEmail());
			ps.setInt(4, book.getFlightId());
			ps.setString(5, book.getSource());
			ps.setString(6, book.getDestination());
			
			ps.setDate(7, sqlDepartureDate);
			ps.setTime(8, sqlDepartureDateTime);
			
			ps.setDouble(9, book.getTotalPrice());
			ps.setString(10, book.getTicketStatus());
			ps.setInt(11, book.getNoOfSeats());
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
