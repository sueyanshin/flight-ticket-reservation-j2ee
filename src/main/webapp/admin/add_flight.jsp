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
<title>Add Flights</title>
<%@include file="/components/allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>


	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-6 mx-auto">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Flight</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>



						<form action="../addFlight" method="post">

							<div class="row">
								<div class="form-floating mb-4 col-md-6">
									<select class="form-select" id="floatingSelect" name="source"
										aria-label="Choose source">
										<option selected disabled>--From--</option>

										<%
										CityDao dao = new CityDao(DBConnect.getConn());
										List<City> list = dao.getAllCity();
										for (City c : list) {
										%>

										<option><%=c.getCityName()%></option>
										<%
										}
										%>
									</select> <label for="floatingSelect">Choose source</label>

								</div>
								<div class="form-floating mb-4 col-md-6">
									<select class="form-select" id="floatingSelect"
										name="destination" aria-label="Choose destination">
										<!-- 
									<option value="7">Lashio</option>
									<option value="8">Myeik</option>
									<option value="9">Myitkyina</option>
									<option value="10">Mandalay</option>
									<option value="11">Nyaung U</option>
									<option value="12">Putao</option>
									<option value="13">Sittwe</option>
									<option value="14">Tachileik</option>
									<option value="15">Thandwe</option>
									
			 -->
										<option selected disabled>--To--</option>

										<%
										for (City c : list) {
										%>

										<option><%=c.getCityName()%></option>
										<%
										}
										%>
									</select> <label for="floatingSelect">Choose destination</label>

								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Departure Date</label> <input
										type="date" required name="departureDate" id="datepicker"
										class="form-control">
								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Departure Time</label> <input
										type="time" required name="departureTime" class="form-control">
								</div>

								<div class="form-floating mb-4">
									<select class="form-select" name="status" id="floatingSelect"
										aria-label="Status">
										<option value="" disabled selected>Choose Status</option>
										<option value="On Lane">On Lane</option>
										<option value="In Air">In Air</option>
										<option value="Scheduled">Scheduled</option>
										<option value="Landed">Landed</option>
									</select> <label for="floatingSelect">Choose Status</label>
								</div>

								<!-- 
								<div class="mb-4 col-md-4">
									<label class="form-label">Adult Price</label> <input required
										name="adultPrice" type="number" class="form-control" min="0">
								</div>

								<div class="mb-4 col-md-4">
									<label class="form-label">Child Price</label> <input required
										name="childPrice" type="number" class="form-control" min="0">
								</div>
								<div class="mb-4 col-md-4">
									<label class="form-label">Infant Price</label> <input required
										name="infantPrice" type="number" class="form-control" min="0">
								</div>

 -->

								<div class="mb-4 col-md-6">
									<label class="form-label">Economy Price</label> <input required
										name="ecoPrice" type="number" class="form-control" min="0">
								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Business Price</label> <input
										required name="businessPrice" type="number"
										class="form-control" min="0">
								</div>


								<div class="mb-4 col-md-6">
									<label class="form-label">Economy Seats</label> <input required
										name="ecoSeats" type="number" class="form-control" min="0">
								</div>

								<div class="mb-4 col-md-6">
									<label class="form-label">Business Seats</label> <input
										required name="businessSeats" type="number"
										class="form-control" min="0">
								</div>


								<button type="submit" class="btn btn-warning col-12">Add
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