<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>BeerHound Registration</title>
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<br>
<br>
<br>
<br>
<div class="container">
<form:form action="createUser.do" method="POST" modelAttribute="user">
		<div class="form-group">
		<form:label path="username">Username:</form:label>
		<form:input path="username"/>
		<form:errors path="username"/>
		</div>
		<div class="form-group">
		<form:label path="email">Email:</form:label>
		<form:input path="email"/>
		<form:errors path="email"/>
		</div>
		<div class="form-group">
		<form:label path="password">Password:</form:label>
		<form:input path="password"/>
		<form:errors path="password"/>
		</div>
		<div class="form-group">
		<form:label path="firstName">First Name:</form:label>
		<form:input path="firstName"/>
		<form:errors path="firstName"/>
		</div>
		<div class="form-group">
		<form:label path="lastName">Last Name:</form:label>
		<form:input path="lastName"/>
		<form:errors path="lastName"/>
		</div>
		<div class="form-group">
		<form:hidden path="enabled" value="true"/>
		</div>
		<div class="form-group">
		<button type="submit" class="btn btn-primary">Register</button>
		</div>
	
	
	</form:form>
</div>
	<!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>