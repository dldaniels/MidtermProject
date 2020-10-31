<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add brewery</title>
</head>
<body>
<div class="container-fluid">

			<h3>Add Brewery</h3> 
			<br>
			
			 <form action="addedBrewery.do" method="GET"> 
				
			<br>
				<label for="name">Name:</label> <input type="text" name="name"
					value="${brewery.name}" /> 
			<br>
				<label for="address">Address:</label> <input type="text" name="address"
					value="${brewery.address}" /> 
			<br>
			
			<label for="breweryWebsite">Brewery website:</label> <input type="text" name="breweryWebsite"
					value="${brewery.breweryWebsite}" /> 
			<br>
				<label for="breweryLogoUrl">Brewery Logo:</label> <input type="text" name="address"
					value="${brewery.breweryLogoUrl}" /> 
			<br>
				<label for="beers">List Of beers:</label> <input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> <br>
			<br>
			<button type=“submit” >Submit</button>
			</form>
			
			<br>
			
		
		<br>
		<br>
		<br>
			<form action="home.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>

		
</div>		
</body>
</html>

