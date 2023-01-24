<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Login</title>
<style type="text/css">
.banner-background{
clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 85%, 66% 100%, 26% 89%, 0 100%, 0% 30%);]
}
</style>
</head>
<body>
	<!-- navbar -->
	<%@include file="normal_navbar.jsp"%>
	
	<!-- used to center at middle of website -->
	<main class="d-flex align-items-center primary-background banner-background"
		style="height: 80vh; padding-bottom:80px">
		
		<!-- Height is used to align the card at required height -->
		
		<div class="container">
			<div class="row">

				<!-- Used to center the card  -->

				<div class="col-md-4 offset-md-4">

					<!-- Card -->

					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-circle fa-3x"></span>
							<p>Login here</p>
						</div>
						<%
						Message m=(Message)session.getAttribute("msg");
						if(m!=null){
							%>
						<div class="alert <%=m.getCssClass() %>" role="alert">
  								<%=m.getContent() %>	
						</div>
						<% 
						session.removeAttribute("msg");
						}
						%>
						
						
						<div class="card-body">

							<!-- Form for login -->

							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" required="required" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="container text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>

							<!-- End form -->
						
						</div>
						
						<!-- End card -->
					
					</div>
				</div>

			</div>
		</div>
	</main>
	
	<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>