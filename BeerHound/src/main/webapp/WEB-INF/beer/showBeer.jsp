<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
</head>
<body>


<form action="updateBeerForm.do" method="GET">
				<input type="hidden" name="id" value="${beer.id }" /> <input
					type="submit" value="Edit Beer" />
			</form>
			<br>

			<form action="deleteBeer.do" method="GET">
				<input type="hidden" name="id" value="${beer.id}" /> <input
					type="submit" value="Delete Beer" />
			</form>
			<br>

			<form action="/" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Home" />
			</form>

<h2>${beer.name}</h2>
<br>
<h2>${beer.typeOfBeer.typeName}</h2>
<br>
<h2>${beer.brewery.name}</h2>
<br>
<img src="${beer.imageUrl}" width = "200" height = "200">



</body>
</html>