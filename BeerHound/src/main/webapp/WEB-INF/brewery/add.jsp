<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Brewery edit</title>
</head>
<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include>
	</div>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="container-fluid">
			
			<%--  <c:choose>
		<c:when test="${! empty user.name}"> --%>


			<h3>Add Brewery</h3>
			<br>


			<form action="addedBrewery.do" method="GET">
				<div>
					<br> <label for="name">Name:</label> <input type="text"
						name="name" value="${brewery.name}" /> <br>
				</div>
				<br> <label for="street">Brewery street:</label> <input
					type="text" name="street" value="${brewery.address.street}" /> <br>

				<br> <label for="city">Brewery city:</label> <input type="text"
					name="city" value="${brewery.address.city}" /> <br>
				<br>
				<label>Select State: </label> <select>
					<option value="AL">AL</option>
					<option value="AK">AK</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="ND">ND</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VT">VT</option>
					<option value="VA">VA</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select> <br> <br> <label for="zip">Brewery zip-code:</label> <input
					type="text" name="zip" value="${brewery.address.zip}" /> <br>

				<div>
					<br> <label for="breweryWebsite">Brewery website:</label> <input
						type="text" name="breweryWebsite"
						value="${brewery.breweryWebsite}" /> <br>
				</div>
				<div>
					<br> <label for="breweryLogoUrl">Brewery Logo-url:</label> <input
						type="text" name="breweryLogoUrl"
						value="${brewery.breweryLogoUrl}" />
						 <br>
						 
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
						 
						<%--  <form action="addBeerForm.do" method="GET">
						<input type="hidden" name="id" value=“${brewery.id}“ /> <input type="submit"
					value="add beer" />
						</form> 
						
						
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
			
			<%-- <form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form> --%>


			<%-- </c:when>
<c:otherwise>
			<h4>If you wish to edit this brewery you must login OR create a profile</h4>
			
		</c:otherwise>

	</c:choose> --%>

		</div>
<%-- 
<div class="container-fluid">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
</div> --%>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
</body>
</html>

