<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"> <i
			class="fa-solid fa-plane text-warning"></i> Herd Air
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${ empty userObj}">
					<li class="nav-item mx-2"><a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item mx-2"><a class="nav-link"
						href="flights.jsp">Flights</a></li>
					<li class="nav-item mx-2"><a class="nav-link"
						href="about_us.jsp">About us</a></li>

					<li class="nav-item"><a class="btn btn-warning"
						href="login.jsp"> <i class="fa-solid fa-right-to-bracket"></i>
							Login
					</a></li>
				</c:if>

				<!-- if user is logined -->
				<c:if test="${not empty userObj}">
					<li class="nav-item mx-2"><a class="nav-link "
						href="index.jsp">Home</a></li>

					<li class="nav-item mx-2"><a class="nav-link"
						href="flights.jsp">Flights</a></li>

					<li class="nav-item mx-2"><a class="nav-link"
						href="my_bookings.jsp">My Bookings</a></li>


					<li class="dropdown">
						<button class="btn btn-outline-warning dropdown-toggle text-dark"
							type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-user"></i> ${userObj.name}
						</button>

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="UserLogout">Logout</a></li>
						</ul>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<script>
	document.addEventListener('DOMContentLoaded', function() {

		var path = window.location.pathname;
		console.log(path);
		var navLinks = document.querySelectorAll('.nav-link');
		navLinks.forEach(function(link) {
			if (path.endsWith(link.getAttribute('href'))) {
				link.classList.add('active');
				link.classList.add('text-warning');

			}

			//else{
			//  var indexLink = document.querySelector('a[href="index.jsp"]');
			//indexLink.classList.add('active');
			//indexLink.classList.add('text-warning');
			//			}
		})

	});
</script>
