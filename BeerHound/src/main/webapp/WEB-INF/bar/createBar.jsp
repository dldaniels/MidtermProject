<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Bar</title>
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include><br>
</div>
<form action="createBar.do" method="GET">
Name: <input type="text" name="name"/><br>
Phone Number: <input type="text" name="phoneNumber"/><br>
Website: <input type="text" name="website"/><br>
Description: <input type="text" name="description"/><br>
Address: <input type="text" name="addressId"/><br>
TimeLastUpdated: <input type="text" name="timeLastUpdated"/><br>
Logo: <input type="text" name="logoUrl"/><br>
<input type="submit" value="Submit"/><br>
<br>
</form>
	<form action="home.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>


</body>
</html>