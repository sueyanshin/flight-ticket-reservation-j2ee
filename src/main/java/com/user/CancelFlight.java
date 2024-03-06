package com.user;

import java.io.IOException;

import com.dao.BookingDao;
import com.dao.FlightDao;
import com.db.DBConnect;
import com.entity.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cancelFlight")
public class CancelFlight extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		
		
		BookingDao dao = new BookingDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.cancelFlight(id)) {
			session.setAttribute("succMsg", "Canceled flight successfully");
			resp.sendRedirect("my_bookings.jsp");
		} else {
			session.setAttribute("errMsg", "Something went wrong on server");
			resp.sendRedirect("my_bookings.jsp");
		}
	}
	

}
