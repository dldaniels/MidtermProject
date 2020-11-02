<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bar Update</title>
</head>
<body>
<div class="container-fluid">
	<c:choose>
		<c:when test="${! empty bar}">
		<p>${bar.name} successfully updated</p><br>

		</c:when>
		
		<c:otherwise>
			Update to Bar failed
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