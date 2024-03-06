<form id="bookingForm">
	<div class="container p-5" id="searchFlight">
		<div class="row">

			<h1 class=" text-center p-3 ">Flight found</h1>

			<div class="col-md-10 mx-auto">


				<div class="card mb-3">
					<img src="./images/flight-card.png" class="card-img-top" alt="...">
					<div class="card-body">


						<!-- 

							UserID and flight ID
 -->
						<input type="hidden" name="userId" value="${userObj.id }">
						<input type="hidden" name="flightId" value="${flight.id }">
						<!-- ROW 1 -->
						<div class="row d-flex justify-content-center align-items-center">

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
						<div class="row d-flex justify-content-center align-items-center">

							<div class="col-md-4 text-start">
								<h5 class="card-title">Departure Date</h5>
								<input type="text" class="form-control" name="date"
									value="${flight.getDepartureDate()}" readonly>
							</div>

							<div class="col-md-4 text-center">
								<h5 class="card-title">Time</h5>
								<input type="text" class="form-control" name="time"
									value="${flight.getDepartureTime()}" readonly>
							</div>


							<div class="col-md-4 text-end">
								<h5 class="card-title">Price</h5>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="priceOption"
										id="businessPrice" value="${flight.getBusinessPrice()}">
									<label class="form-check-label" for="businessPrice">Business:
										${flight.getBusinessPrice()} ks</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="priceOption"
										id="ecoPrice" value="${flight.getEcoPrice()}" checked>
									<label class="form-check-label" for="ecoPrice">Economy:
										${flight.getEcoPrice()} ks</label>
								</div>
							</div>


						</div>

						<hr>





						<div class="row justify-content-center mt-4">
							<div class="col-md-8 my-4 text-center">
								<button type="button" class="btn btn-warning col-md-12 "
									aria-label="Book" onclick=" redirectToLogin()">
									Login to Book</button>
							</div>

						</div>




					</div>
				</div>
			</div>
		</div>
	</div>
</form>
