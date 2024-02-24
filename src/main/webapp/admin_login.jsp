<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="/components/allcss.jsp"%>

</head>
<body>
	<c:if test="${ not empty adminObj }">
		<c:redirect url="admin/index.jsp"></c:redirect>
	</c:if>

	<div class="container p-5 ">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card">
					<div class="card-body">
						<p class="fs-4 text-center fw-bold">Admin Login</p>


						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-5">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>


						<form action="AdminLogin" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email address</label> <input
									type="email" class="form-control" name="email" id="email"
									aria-describedby="emailHelp" required>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" name="password" required
									id="password">
							</div>
							<button type="submit" class="btn btn-warning col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>