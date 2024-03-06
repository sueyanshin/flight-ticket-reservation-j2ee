package com.admin;

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

@WebServlet("/addFlight")
public class AddFlight extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String source = req.getParameter("source");
			String destination = req.getParameter("destination");
			String status = req.getParameter("status");
			LocalDate departureDate = LocalDate.parse((CharSequence) req.getParameter("departureDate"));
			LocalTime departureTime = LocalTime.parse((CharSequence) req.getParameter("departureTime"));
//			double adultPrice = Double.parseDouble(req.getParameter("adultPrice"));
//			double childPrice = Double.parseDouble(req.getParameter("childPrice"));
//			double infantPrice = Double.parseDouble(req.getParameter("infantPrice"));
			double ecoPrice = Double.parseDouble(req.getParameter("ecoPrice"));
			double businessPrice = Double.parseDouble(req.getParameter("businessPrice"));
			int ecoSeats = Integer.parseInt(req.getParameter("ecoSeats"));
			int businessSeats = Integer.parseInt(req.getParameter("businessSeats"));

//			System.out.println(source);
//			System.out.println(destination);
//			System.out.println(status);
//			System.out.println(departureDate);
//			System.out.println(departureTime);
//			System.out.println(adultPrice);
//			System.out.println(childPrice);
//			System.out.println(infantPrice);
//			System.out.println(ecoPrice);
//			System.out.println(businessPrice);
//			System.out.println(ecoSeats);
//			System.out.println(businessSeats);

			Flight f = new Flight(source, destination, status, departureDate, departureTime,ecoPrice, businessPrice, ecoSeats, businessSeats);

			FlightDao dao = new FlightDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.addFlight(f)) {
				session.setAttribute("succMsg", "New flight added successfully");
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
