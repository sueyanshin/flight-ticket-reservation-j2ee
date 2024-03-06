package com.admin;

import java.io.IOException;

import com.dao.CityDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addCity")
public class AddCity extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cityName = req.getParameter("cityName");
		CityDao dao = new CityDao(DBConnect.getConn());
		boolean f = dao.addCityList(cityName);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "New city is added.");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Something went wrong on server.");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
