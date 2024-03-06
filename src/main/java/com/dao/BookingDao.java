package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Booking;

public class BookingDao {
	private Connection conn;

	public BookingDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean book(Booking book) {
		boolean f=false;
		
		try {
			String sql="insert into booking(flight_id,user_id,name,price,no_of_seats) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, book.getFlightId());
			ps.setInt(2, book.getUserId());
			ps.setString(3, book.getName());
			ps.setDouble(4, book.getPrice());
			ps.setInt(5, book.getNoOfSeats());
			
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
