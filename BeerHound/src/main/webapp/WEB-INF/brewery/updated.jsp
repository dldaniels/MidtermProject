<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beerhound Update</title>
</head>
<body>
<div class="container-fluid">
	<c:choose>
		<c:when test="${! empty brewery }">
		<p>${brewery.name} Updated</p><br>
			
		
		
		</c:when>
		<c:when test="${empty brewery }">
			Brewery deleted
			<br>
		</c:when>
		
		<c:otherwise>
			Unable to update brewery
		</c:otherwise>
	</c:choose><br>
	
			<br>
			<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>
</div>
</body>
</html>