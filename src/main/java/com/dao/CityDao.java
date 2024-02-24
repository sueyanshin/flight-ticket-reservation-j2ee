package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.City;

public class CityDao {

	private Connection conn;

	public CityDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCityList(String city) {
		boolean f = false;
		try {
			String sql = "insert into cities(name) value(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, city);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<City> getAllCity(){
		List<City> list=new ArrayList<City>();
		City c=null;
		try {
			String sql="select * from cities";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new City();
				c.setId(rs.getInt(1));
				c.setCityName(rs.getString(2));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getCityCount() {
		int count=0;
		String sql="select count(*) as count from cities";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				count=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}


}
