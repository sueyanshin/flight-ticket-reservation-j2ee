<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top"
	role="navigation">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-plane text-warning"></i> Herd Air</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item mx-2"><a class="nav-link"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="flights.jsp">Flights</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="add_flight.jsp">Add Flight</a></li>
						<li class="nav-item mx-2"><a class="nav-link"
					href="users.jsp">Users</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="bookings.jsp">Bookings</a></li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-outline-warning dropdown-toggle"
						type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<li><a class="dropdown-item" href="../AdminLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>

	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

<script>
	document.addEventListener('DOMContentLoaded', function() {

		var path = window.location.pathname;
		var navLinks = document.querySelectorAll('.nav-link');
		navLinks.forEach(function(link) {
			if (path.endsWith(link.getAttribute('href'))) {
				link.classList.add('active');
				link.classList.add('text-warning');

			}
		})

	});
</script>
