<%@page import="com.tech.blog.dao.Likedao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%
int id=Integer.parseInt(request.getParameter("post_id"));
Postdao dao=new Postdao(ConnectionProvider.getConnection());
Post p=dao.getpostbyid(id);
%>

<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<title><%=p.getPtitle()%> || Techno Geek</title>
<style>
.banner-background{
clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 85%, 66% 100%, 26% 89%, 0 100%, 0% 30%);]
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>
	
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
			 				<a  class="btn btn-outline-light" href="login.jsp"> <i class="fa fa-thumbs-o-up"> </i> <span class="like-counter"> <%=ldao.counLikeonPost(p.getPid()) %></span> </a>
  							<a  class="btn btn-outline-light" href="login.jsp" ><i class="fa fa-commenting-o"></i> <span>20</span> </a>
			 			</div>
			 			
			 		</div>
			 	</div>
			 </div>
		</div>
	
	
</body>
</html>