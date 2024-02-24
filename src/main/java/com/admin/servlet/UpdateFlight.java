package com.admin.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import com.dao.FlightDao;
import com.db.DBConnect;
import com.entity.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateFlight")
public class UpdateFlight extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String source = req.getParameter("source");
			String destination = req.getParameter("destination");
			String status = req.getParameter("status");
			LocalDate departureDate = LocalDate.parse((CharSequence) req.getParameter("departureDate"));
			LocalTime departureTime = LocalTime.parse((CharSequence) req.getParameter("departureTime"));
		
			double ecoPrice = Double.parseDouble(req.getParameter("ecoPrice"));
			double businessPrice = Double.parseDouble(req.getParameter("businessPrice"));
			int ecoSeats = Integer.parseInt(req.getParameter("ecoSeats"));
			int businessSeats = Integer.parseInt(req.getParameter("businessSeats"));
			
			int id=Integer.parseInt(req.getParameter("id"));

			Flight f = new Flight(id,source, destination, status, departureDate, departureTime, ecoPrice, businessPrice, ecoSeats, businessSeats);

			FlightDao dao = new FlightDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.updateFlight(f)) {
				session.setAttribute("succMsg", "Flight updated successfully");
				resp.sendRedirect("admin/flights.jsp");
			} else {
				session.setAttribute("errMsg", "Something went wrong on server");
				resp.sendRedirect("admin/add_flight.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
