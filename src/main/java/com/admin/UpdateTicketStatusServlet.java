package com.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import com.dao.BookingDao;
import com.dao.FlightDao;
import com.db.DBConnect;
import com.entity.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateTicketStatusServlet")
public class UpdateTicketStatusServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String ticketStatus = req.getParameter("ticketStatus");
			
			 int bookingId = Integer.parseInt(req.getParameter("bookingId"));
	            String newStatus = req.getParameter("ticketStatus");

	            // Create an instance of BookingDao and update the ticket status
	            BookingDao bookingDao = new BookingDao(DBConnect.getConn());
	            boolean success = bookingDao.updateTicketStatus(bookingId, newStatus);


			HttpSession session = req.getSession();

			if (success) {
				session.setAttribute("succMsg", "Ticket status updated successfully");
				resp.sendRedirect("admin/bookings.jsp");
			} else {
				session.setAttribute("errMsg", "Something went wrong on server");
				resp.sendRedirect("admin/bookings.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
