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

import com.entity.Booking;
import com.entity.Flight;
import com.entity.User;

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
	
	public int getBookingCount() {
		int count = 0;
		String sql = "select count(*) as count from booking";
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

	
	public List<Booking> getAllBookings(int userId) {
		List<Booking> list = new ArrayList<Booking>();
		Booking book = null;
		try {

			String sql = "select * from booking where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				book = new Booking();
				book.setId(rs.getInt(1));
				book.setUserId(rs.getInt(2));
				book.setName(rs.getString(3));
				book.setEmail(rs.getString(4));
				book.setFlightId(rs.getInt(5));
				book.setSource(rs.getString(6));
				book.setDestination(rs.getString(7));

				// Retrieve departureDate from ResultSet as java.sql.Date
				Date sqlDepartureDate = rs.getDate(8);
				// Convert java.sql.Date to LocalDate
				LocalDate departureDate = sqlDepartureDate.toLocalDate();
				// Set departureDate in Flight object
				book.setDepartureDate(departureDate);

				// Retrieve departureTime from ResultSet as java.sql.Time
				Time sqlDepartureTime = rs.getTime(9);
				// Convert java.sql.Time to LocalTime
				LocalTime departureTime = sqlDepartureTime.toLocalTime();
				// Set departureTime in Flight object
				book.setDepartureTime(departureTime);


				book.setTotalPrice(rs.getDouble(10));

				book.setTicketStatus(rs.getString(11));
				book.setNoOfSeats(rs.getInt(12));

				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean cancelFlight(int id) {
		boolean f = false;
		try {

			String sql = "delete from booking where id=?";
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
	
	
	public List<Booking> getAllBookings() {
		List<Booking> list = new ArrayList<Booking>();
		Booking book = null;
		try {

			String sql = "select * from booking order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				book = new Booking();
				book.setId(rs.getInt(1));
				book.setUserId(rs.getInt(2));
				book.setName(rs.getString(3));
				book.setEmail(rs.getString(4));
				book.setFlightId(rs.getInt(5));
				book.setSource(rs.getString(6));
				book.setDestination(rs.getString(7));

				// Retrieve departureDate from ResultSet as java.sql.Date
				Date sqlDepartureDate = rs.getDate(8);
				// Convert java.sql.Date to LocalDate
				LocalDate departureDate = sqlDepartureDate.toLocalDate();
				// Set departureDate in Flight object
				book.setDepartureDate(departureDate);

				// Retrieve departureTime from ResultSet as java.sql.Time
				Time sqlDepartureTime = rs.getTime(9);
				// Convert java.sql.Time to LocalTime
				LocalTime departureTime = sqlDepartureTime.toLocalTime();
				// Set departureTime in Flight object
				book.setDepartureTime(departureTime);


				book.setTotalPrice(rs.getDouble(10));

				book.setTicketStatus(rs.getString(11));
				book.setNoOfSeats(rs.getInt(12));

				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	  public boolean updateTicketStatus(int bookingId, String ticketStatus) {
	        boolean success = false;
	        try {
	            String sql = "UPDATE booking SET ticket_status = ? WHERE id = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, ticketStatus);
	            ps.setInt(2, bookingId);
	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                success = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return success;
	    }
	
	
}
