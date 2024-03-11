<%@page import="com.entity.User"%>
<%@page import="com.dao.BookingDao"%>
<%@page import="com.entity.Booking"%>
<%@page import="com.entity.Flight"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.dao.FlightDao"%>
<%@page import="com.entity.City"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Booking</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<c:if test="${empty userObj || userObj==null} ">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<!-- 
					my card
					 -->
	<div class="container-fluid">


		<h1 class="fs-3 text-center">My Reservation</h1>
		<p class="fs-5 text-center text-warning">Thank you for using our
			service.</p>

		<c:if test="${not empty errorMsg}">
			<p class="fs-5 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-5 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>



		<%
		User user = (User) session.getAttribute("userObj");
		BookingDao dao = new BookingDao(DBConnect.getConn());
		List<Booking> list = dao.getAllBookings(user.getId());
		for (Booking book : list) {
			if (list.isEmpty() || list == null) {
		%>

		<h3 class="text-center text-secondary">You don't have any
			booking.</h3>

		<%
		} else {
		%>

		<div class="row shadow p-4 m-3  rounded">

			<div class="col-md-2">
				<h3 class="text-secondary">Source</h3>
				<p><%=book.getSource()%>&#8594;<br><%=book.getDestination()%></p>

			</div>

			<div class="col-md-2">
				<h3 class="text-secondary">Date</h3>
				<p><%=book.getDepartureDate()%></p>
			</div>

			<div class="col-md-2">
				<h3 class="text-secondary">Time</h3>
				<p><%=book.getDepartureTime()%></p>

			</div>

			<div class="col-md-2">
				<h3 class="text-secondary">Price</h3>
				<p><%=book.getTotalPrice()%>ks
				</p>

			</div>


			<div class="col-md-2">
				<h3 class="text-secondary">Seats</h3>
				<p><%=book.getNoOfSeats()%></p>

			</div>


			<div class="col-md-2">
				<h3 class="text-secondary">Status</h3>



				<%
				if ("Pending".equals(book.getTicketStatus())) {
				%>

				<p class="bg-warning p-1 rounded text-center">
					<i class="fa-regular fa-clock"></i> Pending
				</p>
				<a href="cancelFlight?id=<%=book.getId()%>"
					class="btn btn-danger w-100"> Cancel Flight </a>

				<%
				} else {
				%>


				<p class="text-success">Approved</p>
				<%
				}
				%>

			</div>



		</div>
		<%
		}
		}
		%>


	</div>














</body>
</html>