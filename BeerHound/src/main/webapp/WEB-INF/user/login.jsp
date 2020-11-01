<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeerHound Registration</title>
</head>
<body>
<div>
<form:form action="login.do" method="POST" modelAttribute="user">
		<br>
		<form:label path="username">Username:</form:label>
		<form:input path="username"/>
		<form:errors path="username"/>
		<br>
		OR
		<br>
		<form:label path="email">Email:</form:label>
		<form:input path="email"/>
		<form:errors path="email"/>
		<br>
		<form:label path="password">Password:</form:label>
		<form:input path="password"/>
		<form:errors path="password"/>
		<br>
		<input type="submit" value="Login"/>
	</form:form>
</div>
</body>
</html>