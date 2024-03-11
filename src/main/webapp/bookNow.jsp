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
	<c:if test="${ empty userObj }">
		<c:redirect url="/login.jsp"></c:redirect>
	</c:if>


							<%
							int id = Integer.parseInt(request.getParameter("id"));
							FlightDao flightDao = new FlightDao(DBConnect.getConn());
							Flight flight = flightDao.getAllFlightsById(id);
							%>
	<form action="BookingServlet" method="post" id="bookingForm">
		<div class="container p-2" id="searchFlight">
			<div class="row">

				<h1 class=" text-center pb-3 ">Book a flight</h1>

				<div class="col-md-10 mx-auto">


					<div class="card mb-3">
						<img src="./images/flight-card.png" class="card-img-top" alt="...">
						<div class="card-body">

							<!-- 
										hidden data
 -->
							<input type="hidden" name="userId" value="${userObj.id }">
							<input type="hidden" name="name" value="${userObj.name }">
							<input type="hidden" name="email" value="${userObj.email }">
							<input type="hidden" name="flightId" value="<%=flight.getId()%>">


							<!-- ROW 1 -->
							<div class="row d-flex justify-content-center align-items-center">

								<div class="col-md-4 text-start">
									<input type="text" class="form-control" name="source"
										value="<%=flight.getSource() %>" readonly>
									<p class="text-secondary">source</p>
								</div>

								<p class="col-md-4 text-center fs-5">
									<i class="fa-solid fa-plane text-secondary"></i>
								</p>


								<div class="col-md-4 text-end">
									<input type="text" class="form-control" name="destination"
										value="<%=flight.getDestination()%>" readonly>
									<p class="text-secondary">destination</p>
								</div>

							</div>

							<hr>

							<!-- ROW 2 -->
							<div class="row d-flex justify-content-center align-items-center">

								<div class="col-md-4 text-start">
									<h5 class="card-title">Departure Date</h5>
									<input type="text" class="form-control" name="date"
										value="<%=flight.getDepartureDate()%>" readonly>
								</div>

								<div class="col-md-4 text-center">
									<h5 class="card-title">Time</h5>
									<input type="text" class="form-control" name="time"
										value="<%=flight.getDepartureTime() %>" readonly>
								</div>


								<div class="col-md-4 text-end">
									<h5 class="card-title">Price</h5>
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="priceOption" id="businessPrice"
											value="<%=flight.getBusinessPrice() %>"> <label
											class="form-check-label" for="businessPrice">Business:
											<%=flight.getBusinessPrice() %> ks</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="priceOption" id="ecoPrice"
											value="<%=flight.getEcoPrice() %>" checked> <label
											class="form-check-label" for="ecoPrice">Economy:
											<%=flight.getEcoPrice()%> ks</label>
									</div>
								</div>


							</div>

							<hr>



							<!-- ROW 3 -->
							<div
								class="row d-flex justify-content-between align-items-center">

								<div class="col-md-4 text-start">
									<h5 class="card-title">Seats</h5>
									<input type="number" aria-label="0" min="1" max="9"
										class="form-control" id="seats" name="noOfSeats" required>
								</div>

								<div class="col-md-4 mt-4 text-end">
									<button type="button" class="btn btn-outline-warning col-md-12"
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
							<div class="row d-flex justify-content-between align-items-start">
								<div class="col-md-6 text-start">
									<h5 class="card-title pt-5">Payment Screenshot</h5>
									<input type="file" class="form-control" id="paymentScreenshot"
										name="paymentScreenshot" accept="image/*" required>
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



	<script type="text/javascript">
	
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

</body>
</html>

