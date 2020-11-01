<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Bar</title>
</head>
<body>
<form action="createBar.do" method="GET">
Name: <input type="text" value="name"/>
Phone Number: <input type="text" value="phoneNumber"/>
Website: <input type="text" value="website"/><br>
Description: <input type="text" value="description"/><br>
Address: <input type="text" value="addressId"/>
TimeLastUpdated: <input type="text" value="timeLastUpdated"/>
Logo: <input type="text" value="logoUrl"/>
<input type="submit" value="Submit"/>
</form>

</body>
</html>