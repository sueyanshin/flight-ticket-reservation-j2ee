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
<title>Home Page</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row position-relative">
			<div class="col-md-12 p-0 m-0">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="images/banner-1.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="images/banner-2.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="images/banner-3.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="images/banner-4.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>

		<!-- Search Box -->

		<div class="row position-absolute top-100 start-50 translate-middle">
			<div class="col-md-12 mx-auto">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Search a flight</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="searchFlight" method="post">
							<div class="row">
								<div class="form mb-4 col-md-4">
									<label for="floatingSelect" class="form-label"> From</label> <select
										class="form-select" id="floatingSelect" required name="source"
										aria-label="Choose source">
										<%
										CityDao dao = new CityDao(DBConnect.getConn());
										List<City> list = dao.getAllCity();
										for (City c : list) {
										%>
										<option><%=c.getCityName()%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="form mb-4 col-md-4">
									<label for="floatingSelect" class="form-label"> To</label> <select
										class="form-select" id="floatingSelect" required
										name="destination" aria-label="Choose destination">
										<%
										for (City c : list) {
										%>
										<option><%=c.getCityName()%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="mb-4 col-md-4">
									<label class="form-label">Departure Date</label> <input
										type="date" required name="departureDate" id="datepicker"
										class="form-control">
								</div>
								<button type="submit"
									class="btn btn-warning col-md-4 text-center mx-auto">
									<i class="fa-solid fa-magnifying-glass"></i> Search
								</button>
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
