<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<title>Register</title>
<meta charset="ISO-8859-1">
<title>Something Went Wrong</title>
</head>
<body>
	<div class="container text-center">
		<img alt="" src="images/error.png" class="img-fluid">
		 <p>Exception is <%=exception %></p>
		<h3>Something Went Wrong...</h3>
		<a href="index.jsp" class="btn btn-outline-primary">Home</a>
	</div>
</body>
</html>