<%@page import="com.tech.blog.helper.Helper"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
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
<title>Home</title>
<style>
.banner-background{
clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 85%, 66% 100%, 26% 89%, 0 100%, 0% 30%);]
}
</style>
</head>
<body>

	<%@include file="normal_navbar.jsp"%>

	<!--creating  banner -->

	<!-- create container which will occupy entire field because of use of fluid -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-light banner-background">
			<div class="container">
				<h3 class="display-4">Welcome to Techno Geek</h3>
				<h3>A Technology Blog</h3>
				<p>Technology is an integral part of our everyday life. As
					frustrating as it often can be, the world of technology plays a
					vital role in connecting us to opportunities for social support,
					news and information, government services, banking, health
					resources, shopping, books, entertainment, and learning tools.
					Despite such physical, economic, and psychological limitations that
					may come with the use of technology, there is a distinct advantage
					for all of us to actively explore and use digital tools.</p>
				<a href="register.jsp" class="btn btn-outline-light btn-lg">
					<span class="	fa fa-user-plus"></span> Start! It's free
				</a>
				<a href="login.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-refresh fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<!-- End of container -->

	<!-- Blog Post -->
	<div class="container">
	<!-- 1st row -->
		<div class="row mb-2">
			<%
			Postdao dao=new Postdao(ConnectionProvider.getConnection());
			List<Post>lst=dao.getallpost();
			for(Post p:lst)				
			{
			%>
			<div class="col-md-4 my-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%=p.getPtitle() %></h5>
						<p class="card-text"><%= Helper.get10words(p.getPcontent())%></p>
						<a href="show_index_post.jsp?post_id=<%=p.getPid() %>"  class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			<%} %>
		</div>
	</div>
	













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

	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>