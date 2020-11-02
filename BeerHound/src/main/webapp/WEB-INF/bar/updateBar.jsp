<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<form action="updateBar.do" method="GET">
	<input type="hidden" value="${bar.id}" name="id">
		Update Name: <input type="text" name="name"/><br>
		Update Description: <input type="text" name="description"/> <br>
		Update Phone Number: <input type="text" name="phoneNumber"/><br>
		Update Website:<input type="text" name="webiste"/><br>
		Update Address: <input type="text" name="address"/><br>
		Update Beer Prices: <input type="text" name="beerPrices"/><br>
	<input type="submit" name="Update SuperBowl"/>
</form>
</body>
</html>