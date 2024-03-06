<%@page import="com.dao.BookingDao"%>
<%@page import="com.entity.Booking"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.FlightDao"%>
<%@page import="com.entity.City"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<%@include file="/components/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	CityDao cityDao = new CityDao(DBConnect.getConn());
	UserDao userDao = new UserDao(DBConnect.getConn());
	%>

	<div class="container p-2">
		<p class="text-center fs-3 py-3 ">Admin Dashboard</p>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-dark" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>



		<div class="row">
		

	<div class="col-md-6 ">
				<div class="card shadow">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-circle fa-3x text-warning"></i><br>
						<p class="fs-4 text-center my-3">
							Users <br>
							<%=userDao.getUserCount()%>
						</p>
						<button type="button" class="btn btn-warning">
								<a href="users.jsp" class="text-decoration-none text-dark">View</a>
						</button>
					</div>
				</div>
			</div>

			<div class="col-md-6 ">
				<div class="card shadow">
					<div class="card-body text-center text-dark">
						<i class="far fa-calendar-check fa-3x text-warning"></i><br>
						<p class="fs-4 text-center my-3">
						
							<%
							BookingDao dao = new BookingDao(DBConnect.getConn());
							int bookingCount = dao.getBookingCount();
							%>
							Bookings <br>
							<%=bookingCount%>
						
						</p>
						<button type="button" class="btn btn-warning">
						<a href="bookings.jsp" class="text-decoration-none text-dark">View</a>
						</button>

					</div>
				</div>
			</div>
		
		
			<div class="col-md-6 mt-3">
				<div class="card shadow ">
					<div class="card-body text-center text-dark">
						<i class="fa-solid fa-plane fa-3x text-warning"></i> <br>
						<p class="fs-4 text-center my-3">

							<%
							FlightDao flightDao = new FlightDao(DBConnect.getConn());
							int flightCount = flightDao.getFlightCount();
							%>
							Flights <br>
							<%=flightCount%>
						</p>
						<button type="button" class="btn btn-warning">
					<a href="flights.jsp" class="text-decoration-none text-dark">View</a>
						</button>
						<button type="button" class="btn btn-outline-warning">
							<a href="add_flight.jsp" class="text-decoration-none text-dark">Add</a>
						</button>

					</div>


				</div>
			</div>




		

			<div class="col-md-6  mt-3">
				<div class="card shadow ">
					<div class="card-body text-center text-dark">
						<i class="fa-solid fa-city fa-3x text-warning"></i><br>
						<p class="fs-4 text-center my-3">


							Cities <br><%=cityDao.getCityCount()%>
						</p>
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#viewCityModal">View</button>
						<button type="button" class="btn btn-outline-warning"
							data-bs-toggle="modal" data-bs-target="#addCityModal">Add</button>

					</div>
				</div>

			</div>

		</div>
	</div>







	<!-- Add City Modal -->
	<div class="modal fade" id="addCityModal" tabindex="-1"
		aria-labelledby="addCityModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addCityModalLabel">Add new city</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addCity" method="post">

						<div class="form-group">
							<label class="mb-3">Enter City Name:</label> <input type="text"
								name="cityName" class="form-control">
						</div>
						<div class="text-center mt-4">
							<button type="submit" class="btn btn-warning col-md-12">Add
								City</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>


	<!-- View City Modal -->
	<div class="modal fade" id="viewCityModal" tabindex="-1"
		aria-labelledby="viewCityModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="viewCityModalLabel">All Cities</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<%
					List<City> list = cityDao.getAllCity();
					%><ol>
						<%
						for (City c : list) {
						%>
						<li><%=c.getCityName()%></li>
						<%
						}
						%>
					</ol>
				</div>
			</div>
		</div>
	</div>
</body>
</html>