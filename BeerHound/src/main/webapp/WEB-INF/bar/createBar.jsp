<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Bar</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include><br>
</div>
<br>
<br>
<br>
<br>

<form action="createdBar.do" method="GET">
Name: <input type="text" name="name"/><br>
Phone Number: <input type="text" name="phoneNumber"/><br>
Website: <input type="text" name="website"/><br>
Description: <input type="text" name="description"/><br>
Logo: <input type="text" name="logoUrl"/><br>
Street Address: <input type="text" name="street" value="${bar.address.street}"/><br>
City: <input type="text" name="city" value="${bar.address.city}"/><br>
ZipCode  <input type="text" name="zip" value="${bar.address.zip}"/><br>


<!-- TimeLastUpdated: <input type="text" name="timeLastUpdated"/><br> -->
<!-- Logo: <input type="text" name="logoUrl"/><br> -->
<input type="submit" value="Submit"/><br>
<br>
</form>
		<form action="/" method="GET">
		<input type="hidden" name="" value="" /> <input type="submit"
			value="Home" />
	</form>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
</body>
</html>