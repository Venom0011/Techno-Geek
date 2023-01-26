<%@page import="com.tech.blog.dao.Likedao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"  %>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
int id=Integer.parseInt(request.getParameter("post_id"));
Postdao dao=new Postdao(ConnectionProvider.getConnection());
Post p=dao.getpostbyid(id);
%>

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
<title><%=p.getPtitle() %>|| Techno Geek</title>
<style type="text/css">
.post-content{
font-weight: 100;
}
.post-code{
font-weight:100;
}
a{
text-decoration: none;
}
.p-user{
	font-style: oblique;
	font-size: 20px;
}
.p-date{
	font-style: italic;
}
body{
		background-image: url("images/background.jpg");
		background-attachment: fixed;
		background-size: cover;
}


</style>
</head>
<body>
	
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="	fa fa-asterisk"></span>Techno Geek
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp"><span
						class="fa fa-home"></span> Home <span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-circle-o"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#postmodal"><span
						class="fa fa-send"></span> Post</a></li>



			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#exampleModal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="	fa fa-sign-out"></span> Log out</a></li>
			</ul>

		</div>
	</nav>
	<!-- end of navbar -->
	
	
	<!-- main body -->
	
		<div class="container">
			 <div  class="row my-4">
			 	<div class="col-md-8 offset-md-2">
			 		<div class="card">
			 			<div class="card-header primary-background text-white">
							<h3 class="post-title"><%=p.getPtitle() %></h3>		 				 
			 			
			 			</div>
			 			  <img src="images/<%=p.getPpic() %>" class="card-img-top embed-responsive-item" alt="...">
			 			<div class="card-body">
			 			
			 				<div class="row">
			 					<div class="col-md-10">
			 					<%Userdao ud=new Userdao(ConnectionProvider.getConnection()); %>
			 					<p class="p-user"><a href="#"><%=ud.getuserbyid(p.getUserid()).getName()%></a> has posted this:  </p>
			 					</div>
			 					<div class="col-md-2">
			 					<p class="p-date"> <%= DateFormat.getDateInstance().format(p.getPdate()) %></p>
			 					</div>
			 				</div>
			 				
			 				<h4 class="post-content"><%=p.getPcontent() %></h4>
			 				<br>
			 				<br>
			 				<h4 class="post-code"><%=p.getPcode() %></h4>
			 			</div>
			 			<div class="card-footer primary-background">
			 				<% Likedao ldao=new Likedao(ConnectionProvider.getConnection()); %>
			 				<a onclick="dolike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light" href="#"> <i class="fa fa-thumbs-o-up"> </i> <span class="like-counter"> <%=ldao.counLikeonPost(p.getPid()) %></span> </a>
  							<a class="btn btn-outline-light" href="#" ><i class="fa fa-commenting-o"></i> <span>20</span> </a>
			 			</div>
			 			
			 		</div>
			 	</div>
			 </div>
		</div>
	
	
	
	<!-- end of main body -->
	
	<!-- Profile Modal -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img alt="error" src="pic/<%=user.getProfile()%>"
							style="max-width: 150px; border-radius: 50%;">
						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
						<br>
						<!-- Profile details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About:</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registration Date:</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- Profile Edit  -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Edit Your Details</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th>ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th>Email:</th>
										<td><input type="email" class="form-control" name="email"
											value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<th>Name:</th>
										<td><input type="text" class="form-control" name="name"
											value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<th>Password:</th>
										<td><input type="password" class="form-control"
											name="password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<th>Gender:</th>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th>About:</th>
										<td><textarea rows="3" class="form-control" name="about"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<th>Profile:</th>
										<td><input type="file" class="form-control" name="img"
											required="required"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary ">Save</button>
								</div>
							</form>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End of modal -->
	
	
	<!-- Start of Post Modal -->

	<div class="modal fade" id="postmodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enter the post
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddPostServlet" method="post" id="post-form">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">---Select
									Category---</option>

								<%
								Postdao dao1 = new Postdao(ConnectionProvider.getConnection());
								ArrayList<Category> lst = dao1.getCategories();
								for (Category c : lst) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>

							</select>

						</div>

						<div class="form-group">
							<input name="ptitle" type="text"
								placeholder="Enter the Post Title " class="form-control">
						</div>

						<div class="form-group">
							<textarea name="pcontent" style="height: 200px;"
								placeholder="Enter the content" class="form-control"></textarea>
						</div>

						<div class="form-group">
							<textarea name="pcode" style="height: 200px;"
								placeholder="Enter the program(if any)" class="form-control"></textarea>
						</div>

						<div class="form-group">
							Select your pic<br> <input type="file" name="ppic"
								class="form-control">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
							<button type="reset" class="btn btn-outline-primary">Reset</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>

	<!-- End of Post Modal -->

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			let editstatus = false;
			$('#edit-profile-btn').click(function() {
				if (editstatus == false) {
					$('#profile-details').hide()
					$('#profile-edit').show();
					editstatus = true;
					$(this).text("Back")
				} else {
					$('#profile-details').show()
					$('#profile-edit').hide();
					editstatus = false;
					$(this).text("Edit")
				}
			})
		});
	</script>

	<!-- post script -->
	
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							console.log("loaded")
							$('#post-form')
									.on(
											'submit',
											function(event) {
												event.preventDefault();
												console.log("done")
												let form = new FormData(this);

												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,

															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																console
																		.log(data)
																if (data.trim() == 'done') {
																	swal(
																			"Success",
																			"Post Uploaded Successfully",
																			"success");
																} else {
																	swal(
																			"Error",
																			"Something Went Wrong..try again",
																			"error");
																}
															},
															error : function(jqXHR,textStatus,errorThrown) {
																swal("Error!","Something Went Wrong..try again","error");
															},
															processData : false,
															contentType : false
														});
											});
						});
	</script>


</body>
</html>