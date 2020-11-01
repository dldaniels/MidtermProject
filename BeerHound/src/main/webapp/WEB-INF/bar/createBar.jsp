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
Name: <input type="text" name="name"/>
Phone Number: <input type="text" name="phoneNumber"/>
Website: <input type="text" name="website"/><br>
Description: <input type="text" name="description"/><br>
Address: <input type="text" name="addressId"/>
TimeLastUpdated: <input type="text" name="timeLastUpdated"/>
Logo: <input type="text" name="logoUrl"/>
<input type="submit" value="Submit"/>
</form>

</body>
</html>