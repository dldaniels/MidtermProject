<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Bars</title>
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include><br>
<div class="container-fluid">
<h3>Bar List</h3>

	<h3>Bar List</h3>
	
	<form action="getBar.do" method="GET">
	Bar ID: <input type="text" name="id"/> 
	<input type="submit" value="Find Bar"/>
	</form>

<form action="createBar.do" method="GET">
<input type="text" name="id"/>
<input type="submit" value="Find Bar"/>
</form>

</div>
</div>
</body>
</html>