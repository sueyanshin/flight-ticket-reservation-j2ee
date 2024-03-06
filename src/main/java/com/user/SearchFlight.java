package com.user;

import java.io.IOException;
import java.time.LocalDate;

import com.dao.FlightDao;
import com.db.DBConnect;
import com.entity.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchFlight")
public class SearchFlight extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String source = req.getParameter("source");
        String destination = req.getParameter("destination");
        LocalDate departureDate = LocalDate.parse(req.getParameter("departureDate"));

        FlightDao flightdao = new FlightDao(DBConnect.getConn());
        Flight flight = flightdao.searchFlight(source, destination, departureDate);

        if (flight != null) {
            req.setAttribute("flight", flight);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {
            req.setAttribute("errorMsg", "No flights found for the specified criteria.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
