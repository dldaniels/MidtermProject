<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bar updated</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty bar}">
			<p>Bar has been successfully updated ${bar.name}</p>
		</c:when>
		<c:otherwise>
			<p>Update to Bar has failed</p>
		</c:otherwise>
	</c:choose>

</body>
</html>