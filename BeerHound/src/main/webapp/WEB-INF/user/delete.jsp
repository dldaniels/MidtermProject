<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Profile</title>
</head>
<body>
	<c:choose>
		<c:when test="${deleted }">
			User Profile Deleted
			<a href="index.do">Home</a>
		</c:when>
		<c:otherwise>
			Unable to delete profile
			<a href="user.do?id=${id }">Return</a>
		</c:otherwise>
	</c:choose>
	
</body>
</html>