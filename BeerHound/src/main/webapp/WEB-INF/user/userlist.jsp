<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Results</title>
</head>
<body>

<div class="container">
<table class="table">
		<thead>
			<tr>
				<th>Users</th>
			</tr>
		</thead>
			<c:forEach items="${userList }" var="u">
				<tr>
					<td><a href="getUser.do?id=${u.id }">${u.id }</a>
				</tr>
			</c:forEach>
</table>
</div>

</body>
</html>