<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beer list</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>



<body>

	<div class="container-fluid">

		<h3>Beer List</h3>

		<form action="getBeer.do" method="GET">
			Beer ID: <input type="text" name="id" /> <input type="submit"
				value="Find Beer" />
		</form>
		<br>
		
		<form action="addBeerForm.do" method="GET">
		Add A Beer: <input type= "submit" value = "Add Beer" />
		</form>

		<table class="table table-striped table-hover">
			<thead class="thead thead-dark">
				<tr>
					<th>Beer Name</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${beers}" var="beer">
					<tr>
						<td><a href="getBeer.do?id=${beer.id}">${beer.name}</a></td>
						<td><img src="${beer.imageUrl}" width ="100" height = "100"> 
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

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
</head>
<body>

</body>
</html>