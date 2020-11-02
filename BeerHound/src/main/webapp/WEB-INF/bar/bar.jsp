<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bar Info</title>
</head>
<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include>
	</div>
	<div>
		<h5>Bar name: ${bar.name}</h5>
		<br>
		<table>
			<tr>
				<th>${bar.description}</th>
				<th>${bar.phoneNumber}</th>
				<th>${bar.website}</th>
				<th>${bar.address}</th>
				<th>Bar Price: ${bar.beerPrices}</th>
				<th>Bar Rating: ${bar.barRating}</th>
			<tr>
		</table>
	</div>
	<div>
		<form action="updateBar.do" method="GET">
			<input type="hidden" value="${bar.id}" name="id"> <input
				type="submit" value="Update Bar info">
		</form>
	</div>
	<div>
		<form action="deletebar.do" method="GET">
			<input type="hidden" value="${bar.id}" name="id"> <input
				type="submit" value="Delete Bar">
		</form>
	</div>
	<form action="/" method="GET">
		<input type="hidden" name="" value="" /> <input type="submit"
			value="Home" />
	</form>
</body>
</html>