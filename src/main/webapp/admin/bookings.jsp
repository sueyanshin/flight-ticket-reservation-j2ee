
<%@page import="com.entity.Booking"%>
<%@page import="com.dao.BookingDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
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
<title>Bookings</title>
<%@include file="../components/allcss.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="row ">
		<div class="col-md-12 mx-auto">

			<div class="card">
				<div class="card-body table-responsive">
					<p class="fs-3 text-center">All Bookings</p>

					<c:if test="${not empty errorMsg}">
						<p class="fs-5 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty succMsg}">
						<div class="fs-5 text-center text-success" role="alert">${succMsg}</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>


					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Flight ID</th>
								<th scope="col">Source</th>
								<th scope="col">Destination</th>
								<th scope="col">Departure Date</th>
								<th scope="col">Departure Time</th>
								<th scope="col">Total Price</th>
								<th scope="col">Number of Seats</th>
								<th scope="col">Ticket Status</th>
							</tr>
						</thead>
						<tbody>

							<%
							BookingDao dao = new BookingDao(DBConnect.getConn());
							List<Booking> list = dao.getAllBookings();
							if (list == null || list.isEmpty()) {
							%>
							<tr>
								<td colspan="11" class="text-center">Empty user data.</td>
							</tr>
							<%
							}
							for (Booking b : list) {
							%>

							<tr>
								<th scope="row"><%=b.getId()%></th>
								<td><%=b.getName()%></td>
								<td><%=b.getEmail()%></td>
								<td><%=b.getFlightId()%></td>
								<td><%=b.getSource()%></td>
								<td><%=b.getDestination()%></td>
								<td><%=b.getDepartureDate()%></td>
								<td><%=b.getDepartureTime()%></td>
								<td><%=b.getTotalPrice()%></td>
								<td><%=b.getNoOfSeats()%></td>
								<!-- 
								<td><select class="form-select"
									aria-label="Default select example">
										<option selected value="1">Pending</option>
										<option value="2">Approved</option>
								</select> <%=b.getTicketStatus()%></td>
								 -->

								<td>
									<form id="updateStatusForm_<%=b.getId()%>"
										action="../updateTicketStatusServlet" method="post">
										<input type="hidden" name="bookingId" value="<%=b.getId()%>">
										<select class="form-select"
											aria-label="Default select example" name="ticketStatus"
											onchange="submitUpdateStatusForm(<%=b.getId()%>)">
											<option value="Pending"
												<%="Pending".equalsIgnoreCase(b.getTicketStatus()) ? "selected" : ""%>>Pending</option>
											<option value="Approved"
												<%="Approved".equalsIgnoreCase(b.getTicketStatus()) ? "selected" : ""%>>Approved</option>
										</select>
									</form>
								</td>

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

	<script type="text/javascript">
function submitUpdateStatusForm(bookingId) {
    document.getElementById("updateStatusForm_" + bookingId).submit();
}
</script>


</body>
</html>

