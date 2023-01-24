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
<title>Register</title>
<meta charset="ISO-8859-1">
<title>Register</title>
<style type="text/css">
.banner-background{
clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 85%, 66% 100%, 26% 89%, 0 100%, 0% 30%);]
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background banner-background" style="padding-bottom: 80px">
		<div class="container">

			<!--col-md-4 will leave 4 col grid from left side and offset-md-4 will leave 4 col grids from right side  -->
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span>
						<p>Register here</p>
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="post" id="reg-form">
						
							<div class="form-group">
								<label for="user_name">User name</label> <input
									type="text" name="uname" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter user name">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
								
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<div class="form-group form">
								<label for="gender">Select gender</label>
								<br>
								<input type="radio" id="gender" name="gender" value="Male">Male
								<input type="radio" id="gender" name="gender" value="Female">Female
							</div>
						
							<div class="form-group">
							<textarea name="about" class="form-control" rows="5" placeholder="Enter something about yourself" ></textarea>
							
							</div>
							
							<div class="form-group form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and conditions</label>
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>


				</div>

			</div>
		</div>


	</main>




	<!-- Javascript -->
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
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

		
		<script type="text/javascript">
			$(document).ready(function(){
				console.log("loaded")
				$('#reg-form').on('submit',function(event){
					event.preventDefault();
					let form=new FormData(this);
					
					$.ajax({
						url:"RegisterServlet",
						type:'POST',
						data:form,
						
						
						success:function(data,textStatus,jqXHR){
							if(data.trim()=='done'){
							swal("Registered Successfully...Redirecting to Login page")
							.then((value) => {
							 window.location="login.jsp"
							});
							}else{
								swal(data);
							}
						},
						error:function(jqXHR,textStatus,errorThrown){
							swal("Something Went Wrong...Please try again")
						},
						processData:false,
						contentType:false
					});
				});
			});
		</script>
		
</body>
</html>