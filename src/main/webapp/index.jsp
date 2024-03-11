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

		<div class="row position-absolute top-50 start-50 translate-middle">
			<div class="col-md-12 mx-auto">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Search a flight</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-5 text-center text-success" role="alert">${succMsg}</div>
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


								<div class="mb-4 mx-auto col-md-6">

									<button type="submit"
										class="btn btn-warning col-md-12 text-center mx-auto">
										<i class="fa-solid fa-magnifying-glass"></i> Search
									</button>

								</div>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Section Available -->
	<!-- 
Show flight card if user search flight exist
 -->
	<c:if test="${not empty flight}">


		<!-- Flight found for  logged user -->
		<c:if test="${empty userObj}">
			<%@include file="FlightFound.jsp"%>

		</c:if>



		<!-- Flight found for  logged user -->

		<c:if test="${not empty userObj }">
			<form action="BookingServlet" method="post" id="bookingForm">
				<div class="container p-5" id="searchFlight">
					<div class="row">

						<h1 class=" text-center p-3 ">Flight found</h1>

						<div class="col-md-10 mx-auto">


							<div class="card mb-3">
								<img src="./images/flight-card.png" class="card-img-top"
									alt="...">
								<div class="card-body">


									<!-- 
										hidden data
 -->
									<input type="hidden" name="userId" value="${userObj.id }">
									<input type="hidden" name="name" value="${userObj.name }">
									<input type="hidden" name="email" value="${userObj.email }">
									<input type="hidden" name="flightId" value="${flight.id }">


									<!-- ROW 1 -->
									<div
										class="row d-flex justify-content-center align-items-center">

										<div class="col-md-4 text-start">
											<input type="text" class="form-control" name="source"
												value="${flight.getSource()}" readonly>
											<p class="text-secondary">source</p>
										</div>

										<p class="col-md-4 text-center fs-5">
											<i class="fa-solid fa-plane text-secondary"></i>
										</p>


										<div class="col-md-4 text-end">
											<input type="text" class="form-control" name="destination"
												value="${flight.getDestination()}" readonly>
											<p class="text-secondary">destination</p>
										</div>

									</div>

									<hr>

									<!-- ROW 2 -->
									<div
										class="row d-flex justify-content-center align-items-center">

										<div class="col-md-4 text-start">
											<h5 class="card-title">Departure Date</h5>
											<input type="text" class="form-control" name="date"
												value="${flight.getDepartureDate()}" readonly>
										</div>

										<div class="col-md-4 text-center">
											<h5 class="card-title">Departure Time</h5>
											<input type="text" class="form-control" name="time"
												value="${flight.getDepartureTime()}" readonly>
										</div>


										<div class="col-md-4 text-end">
											<h5 class="card-title">Price</h5>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="priceOption" id="businessPrice"
													value="${flight.getBusinessPrice()}"> <label
													class="form-check-label" for="businessPrice">Business:
													${flight.getBusinessPrice()} ks</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="priceOption" id="ecoPrice"
													value="${flight.getEcoPrice()}" checked> <label
													class="form-check-label" for="ecoPrice">Economy:
													${flight.getEcoPrice()} ks</label>
											</div>
										</div>


									</div>

									<hr>


									<c:if test="${not empty userObj} }">

										<%@include file="components/navbar.jsp"%>

									</c:if>
									<!-- ROW 3 -->
									<div
										class="row d-flex justify-content-between align-items-center">

										<div class="col-md-4 text-start">
											<h5 class="card-title">Seats</h5>
											<input type="number" aria-label="0" min="1" max="9"
												class="form-control" id="seats" name="noOfSeats" required>
										</div>

										<div class="col-md-4 mt-4 text-end">
											<button type="button"
												class="btn btn-outline-warning col-md-12"
												aria-label="Calculate Price" onclick="calculatePrice()">
												Calculate Price</button>
										</div>

										<div class="col-md-4 mt-4 text-end">
											<h5 class="card-title">
												Total Price:(ks) <input type="number" aria-label="0"
													class="form-control" id="totalPrice" name="totalPrice"
													value="0" readonly>
											</h5>
										</div>
									</div>

<!-- 
									<div
										class="row d-flex justify-content-between align-items-start">
										<div class="col-md-6 text-start">
											<h5 class="card-title pt-5">Payment Screenshot</h5>
											<input type="file" class="form-control"
												id="paymentScreenshot" name="paymentScreenshot"
												accept="image/*" required>
										</div>

										<div class="col-md-6 text-center">
											<h5 class="card-title pt-5">Pay with Kpay</h5>
											<img alt="Scan me" src="./images/scan.png">
										</div>
									</div>
 -->

									<div class="row justify-content-center mt-4">
										<div class="col-md-8 my-4 text-center">
											<button type="submit" class="btn btn-warning col-md-12 "
												aria-label="Book" onclick=" submitBookingForm()">
												<c:choose>
													<c:when test="${not empty userObj}">
                    Book Now
                </c:when>

												</c:choose>
											</button>
										</div>

									</div>



								</div>


							</div>
						</div>


					</div>

				</div>
			</form>
		</c:if>

	</c:if>

	<script>
		// JavaScript to scroll to the #searchFlight element
		window.onload = function() {
			var element = document.getElementById("searchFlight");
			if (element) {
				element.scrollIntoView({
					behavior : "smooth"
				});
			}
		};

		function calculatePrice() {
			var seats = document.getElementById("seats").value;
			var priceOption = document
					.querySelector('input[name="priceOption"]:checked').value;
			if (seats > 0 && seats <= 9) {

				var totalPrice = seats * priceOption;
				document.getElementById("totalPrice").value = totalPrice;
				console.log(totalPrice);
			} else {
				alert("Please enter valid number of seats.");
			}

		}
		
		function redirectToLogin(){
		    console.log("Redirecting to login page...");
	        window.location.href = "login.jsp";
		}
		

		function submitBookingForm() {
			var seat = document.getElementById("seats").value;
			var paymentScreenshot = document
					.getElementById("paymentScreenshot").value;

			if (seat == "") {
				alert("Please enter the number of seats.");
				return false;
			}

			if (paymentScreenshot == "") {
				alert("Please upload the payment screenshot.");
				return false;
			}
			
		    var userObjExists = ${not empty userObj};


		    if (!userObjExists) {
		        window.location.href = "login.jsp";
		    } else {
		        document.getElementById("bookingForm").submit();
		    }
		}
	</script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {

			// Get today's date
			var today = new Date().toISOString().split('T')[0];
			document.getElementById('datepicker').setAttribute('min', today);
			document.getElementById('datepicker').setAttribute('format',
					'dd-mm-yyyy');
		});

		function scrollToSection(sectionId) {
			var section = document.getElementById(sectionId);
			if (section) {
				section.scrollIntoView({
					behavior : 'smooth'
				});
			}
		}
	</script>

</body>
</html>
