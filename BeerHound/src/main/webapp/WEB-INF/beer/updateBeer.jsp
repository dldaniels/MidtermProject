<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update beer</title>
</head>
<body>
<h3>Edit Beer</h3>

<form action="updateBeer.do" method="GET">

		Name of Beer: <input type="text" name="name" value="${beer.name}"/><br>
			Type of Beer: <input type="text" name="type" value="${beer.typeOfBeer}"/><br>
			Alcohol content: <input type="number" name="Alcohol content" step=".1" value="${beer.alcoholContent }"/><br>
			ImageUrl: <input type="text"name="image" value="${beer.imageUrl}"/><br> 
		
		<input class="btn btn-warning" type="submit" value="Add beer" />
	</form>

</body>
</html>