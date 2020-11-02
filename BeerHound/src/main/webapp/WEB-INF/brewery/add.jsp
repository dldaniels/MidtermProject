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
			<div>
			<br>
				<label for="name">Name:</label> <input type="text" name="name"
					value="${brewery.name}" /> 
				<br>
				</div> 
			<br>
				<label for="address">Address:</label> <input type="text" name="address"
					value="${brewery.address}" /> 
			<br> 
			<div>
			<br>
			<label for="breweryWebsite">Brewery website:</label> <input type="text" name="breweryWebsite"
					value="${brewery.breweryWebsite}" /> 
			<br>
					</div>
					<div>
					<br>
				<label for="breweryLogoUrl">Brewery Logo:</label> <input type="text" name="address"
					value="${brewery.breweryLogoUrl}" /> 
			<br>
			</div>
				<%-- <label for="beers">List Of beers:</label> <input type="text" name="beers"
					value="${brewery.beers}" /> <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> 
					<br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" />
					 <br>
						beer:<input type="text" name="beers"
					value="${brewery.beers}" /> 
					<br>
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
					value="${brewery.beers}" /> <br> --%>
			<br>
          
          
          
		    <br>
			<button type=“submit” >Submit</button>
			</form>
			<br>
			<br>
			<br>
			<br>
			<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>

		
</div>		
</body>
</html>

