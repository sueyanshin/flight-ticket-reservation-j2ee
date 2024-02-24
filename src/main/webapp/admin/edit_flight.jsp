<%@page import="com.entity.Flight"%>
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
<title>Edit Flight</title>
<%@include file="/components/allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>


	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-6 mx-auto offset-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Flight Details</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						FlightDao flightDao = new FlightDao(DBConnect.getConn());
						Flight flight = flightDao.getAllFlightsById(id);
						%>

						<form action="../updateFlight" method="post">

							<div class="row">
								<div class="form-floating mb-4 col-md-6">
									<select class="form-select" id="floatingSelect" name="source"
										aria-label="Choose source">
										<option disabled>--select--</option>

										<%
										CityDao cityDao = new CityDao(DBConnect.getConn());
										List<City> list = cityDao.getAllCity();

										for (City c : list) {
											boolean isSelected = c.getCityName().equals(flight.getSource());
										%>

										<option <%=isSelected ? "selected" : ""%>><%=c.getCityName()%></option>
										<%
										}
										%>
									</select> <label for="floatingSelect">Choose source</label>

								</div>
								<div class="form-floating mb-4 col-md-6">
									<select class="form-select" id="floatingSelect"
										name="destination" aria-label="Choose destination">
										<option disabled>--select--</option>

										<%
										for (City c : list) {
											boolean isSelected = c.getCityName().equals(flight.getDestination());
										%>

										<option <%=isSelected ? "selected" : ""%>><%=c.getCityName()%></option>
										<%
										}
										%>
									</select> <label for="floatingSelect">Choose destination</label>

								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Departure Date</label> <input
										type="date" required name="departureDate" id="datepicker"
										class="form-control" value="<%=flight.getDepartureDate()%>">
								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Departure Time</label> <input
										type="time" required name="departureTime" class="form-control"
										value="<%=flight.getDepartureTime()%>">
								</div>

								<div class="form-floating mb-4">
									<select class="form-select" name="status" id="floatingSelect"
										aria-label="Status">
										<option value="" disabled>Choose Status</option>
										<option value="<%=flight.getStatus()%>" selected><%=flight.getStatus()%></option>
										<option value="On Lane">On Lane</option>
										<option value="In Air">In Air</option>
										<option value="Scheduled">Scheduled</option>
										<option value="Landed">Landed</option>
									</select> <label for="floatingSelect">Choose Status</label>
								</div>


								<div class="mb-4 col-md-6">
									<label class="form-label">Economy Price</label> <input required
										name="ecoPrice" type="number" class="form-control" min="0"
										value="<%=flight.getEcoPrice()%>">
								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Business Price</label> <input
										required name="businessPrice" type="number"
										class="form-control" min="0"
										value="<%=flight.getBusinessPrice()%>">
								</div>


								<div class="mb-4 col-md-6">
									<label class="form-label">Economy Seats</label> <input required
										name="ecoSeats" type="number" class="form-control" min="0"
										value="<%=flight.getEcoSeats()%>">
								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Business Seats</label> <input
										required name="businessSeats" type="number"
										class="form-control" min="0"
										value="<%=flight.getBusinessSeats()%>">
								</div>

								<input type="hidden" name="id" value="<%=flight.getId()%>">
								<button type="submit" class="btn btn-warning col-12">Update
									Flight</button>
							</div>
						</form>
					</div>
				</div>
			</div>



		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {

			// Get today's date
			var today = new Date().toISOString().split('T')[0];
			document.getElementById('datepicker').setAttribute('min', today);
			document.getElementById('datepicker').setAttribute('format',
					'dd-mm-yyyy');
		});
	</script>


</body>
</html>