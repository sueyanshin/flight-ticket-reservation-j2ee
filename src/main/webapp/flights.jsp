
<%@page import="com.entity.City"%>
<%@page import="com.dao.CityDao"%>
<%@page import="com.entity.Flight"%>
<%@page import="com.dao.FlightDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Flights</title>
<%@include file="../components/allcss.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<c:if test="${empty userObj} ">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="row ">
		<div class="col-md-12 mx-auto">

			<div class="card">
				<div class="card-body table-responsive">
					<p class="fs-3 text-center">Check All Flights Here</p>


					<c:if test="${not empty errorMsg}">
						<p class="fs-4 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<div class="fs-4 text-center text-success" role="alert">${succMsg}</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Source</th>
								<th scope="col">Destination</th>
								<th scope="col">Departure Date</th>
								<th scope="col">Departure Time</th>
								<th scope="col">Status</th>
								<th scope="col">Economy Price</th>
								<th scope="col">Business Price</th>
								<th scope="col">Action</th>

							</tr>
						</thead>
						<tbody>

							<%
							FlightDao dao = new FlightDao(DBConnect.getConn());
							List<Flight> list = dao.getAllFlights();
							if (list == null || list.isEmpty()) {
							%>
							<tr>
								<td colspan="11" class="text-center">Empty flight data.</td>
							</tr>
							<%
							}
							for (Flight f : list) {
							%>

							<tr>
								<th scope="row"><%=f.getId()%></th>
								<td><%=f.getSource()%></td>
								<td><%=f.getDestination()%></td>
								<td><%=f.getDepartureDate()%></td>
								<td><%=f.getDepartureTime()%></td>
								<td><%=f.getStatus()%></td>

								<td><%=f.getEcoPrice()%>ks</td>
								<td><%=f.getBusinessPrice()%></td>

								<td><c:if test="${not empty userObj} ">
										<a href="reservation.jsp?id=<%=f.getId()%>"
											class="btn btn-sm btn-warning me-2"> Book Now </a>
									</c:if> <c:if test="${empty userObj }">
										<a href="login.jsp" class="btn btn-sm btn-warning">Login
											to book</a>
									</c:if></td>

							</tr>
							<%
							}
							%>


						</tbody>
					</table>

				</div>
			</div>

		</div>
	</div>



</body>
</html>

