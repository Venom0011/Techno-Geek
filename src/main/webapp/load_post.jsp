<%@page import="com.tech.blog.dao.Likedao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<div class="row">
<%
Postdao dao=new Postdao(ConnectionProvider.getConnection());
User user=(User)session.getAttribute("user");

int cid= Integer.parseInt(request.getParameter("cid"));
List<Post> lst=null;

// if cid fetched is 0 means load all post of logged in user
if(cid==0){
 lst=dao.getallpost();
}

// else load particaular category of that user
else{
	lst=dao.getpostbycatid(cid);
}
if(lst.size()==0){
	out.println("<h4 class='display-3 text-center'>No Post in this Category..</h4>");
	return;
}
for(Post p:lst){
%>

<div class="col-md-6 mt-2">
	<div class="card-columns">
	<div class="card" style="width: 18rem;">
    <img src="images/<%=p.getPpic() %>" class="card-img-top embed-responsive-item" alt="...">
    <div class="card-header text-white" style="background: #2196F3!important;">
    <h5><b><%=p.getPtitle() %></b></h5>
    </div>
  <div class="card-body">
   	<p class="card-text"><%=Helper.get10words(p.getPcontent()) %></p>
  	</div>
  	<div class="card-footer text-center">
  	<% Likedao ld=new Likedao(ConnectionProvider.getConnection()); %>
  		<a onclick="dolike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-primary" href="#"> <i class="fa fa-thumbs-o-up"> </i><span class="like-counter"><%=ld.counLikeonPost(p.getPid())%></span> </a>
  		<a class="btn btn-outline-primary btn-sm" href="show_post_page.jsp?post_id=<%=p.getPid()%>">Read more</a>
  		<a class="btn btn-outline-primary btn-sm" href="#" ><i class="fa fa-commenting-o"></i> <span>20</span> </a>
  	</div>
	</div>
	</div>
	</div>


<%} %>
</div>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>