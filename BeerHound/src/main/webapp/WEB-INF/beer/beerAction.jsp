<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beer Action</title>
</head>
<body>
<div class="container-fluid">
	<c:choose>
		<c:when test="${! empty beer.name }">
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thank You!</strong> Your update was successful.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
		<%-- <p>${beer.name} has been updated</p><br> --%>
			
		</c:when>
		<c:when test="${empty beer.name }">
			Beer deleted
			<br>
		</c:when>
		
		<c:otherwise>
			Unable to update beer
		</c:otherwise>
	</c:choose><br>
	
			<br>
			<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Home" />
			</form>
</div>

</body>
</html>