package com.user;

import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import com.dao.BookingDao;
import com.db.DBConnect;
import com.entity.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("userId"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");

		int flightId=Integer.parseInt(req.getParameter("flightId"));
		String source=req.getParameter("source");
		String destination=req.getParameter("destination");
		LocalDate departureDate = LocalDate.parse((CharSequence) req.getParameter("date"));
		LocalTime departureTime = LocalTime.parse((CharSequence) req.getParameter("time"));
//		String ticketStatus = req.getParameter("ticketStatus");
		double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));
		int noOfSeats=Integer.parseInt(req.getParameter("noOfSeats"));
		
		Booking book=new Booking(userId,name,email,flightId,source,destination,departureDate,departureTime,totalPrice,"Pending",noOfSeats);
		BookingDao dao=new BookingDao(DBConnect.getConn());
		HttpSession session=req.getSession();
		
		if(dao.bookAFlight(book)) {
			session.setAttribute("succMsg", "Booking successful.");
			resp.sendRedirect("my_bookings.jsp");
		}else {
			session.setAttribute("errorMsg", "Something went wrong on server.");
			resp.sendRedirect("MyBooking.jsp");
		}
	}

}
