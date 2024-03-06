package com.admin;

import java.io.IOException;

import com.dao.FlightDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteFlight")
public class DeleteFlight extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		
		
		FlightDao dao = new FlightDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteFlight(id)) {
			session.setAttribute("succMsg", "Flight deleted successfully");
			resp.sendRedirect("admin/flights.jsp");
		} else {
			session.setAttribute("errMsg", "Something went wrong on server");
			resp.sendRedirect("admin/flights.jsp");
		}
	}
	

}
