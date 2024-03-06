
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
<title>All Flights</title>
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
					<p class="fs-3 text-center">All Users</p>



					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
							</tr>
						</thead>
						<tbody>

							<%
							UserDao dao = new UserDao(DBConnect.getConn());
							List<User> list = dao.getAllUsers();
							if (list == null || list.isEmpty()) {
							%>
							<tr>
								<td colspan="11" class="text-center">Empty user data.</td>
							</tr>
							<%
							}
							for (User u : list) {
							%>

							<tr>
								<th scope="row"><%=u.getId()%></th>
								<td><%=u.getName()%></td>
								<td><%=u.getEmail()%></td>
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



</body>
</html>

