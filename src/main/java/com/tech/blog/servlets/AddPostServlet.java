package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.Postdao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		String ptitle=request.getParameter("ptitle");
		String pcontent=request.getParameter("pcontent");
		String pcode=request.getParameter("pcode");
		Part part=request.getPart("ppic");
		
		//getting user id from user 
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("user");
		
		//The Post object contains the one psot value now save it to database
		Post p=new Post(ptitle, pcontent, pcode, part.getSubmittedFileName(), null, cid, user.getId());
		Postdao dao=new Postdao(ConnectionProvider.getConnection());
		if(dao.savepost(p)) {
			String path="E:/JAVA Exercise/Techno Geek/src/main/webapp/images/"+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
		}
		else {
			out.println("error");
		}
			
	
	}

}
