package com.tech.blog.servlets;

import java.io.File;
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

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String about=request.getParameter("about");
		
		Part p=request.getPart("img");
		
		String imgname=p.getSubmittedFileName();
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("user");
		
		PrintWriter out=response.getWriter();
		// setting the edited value to user session object
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		String oldFile=user.getProfile();
		user.setProfile(imgname);
		
		//Updating the values in database
		Userdao dao=new Userdao(ConnectionProvider.getConnection());
		boolean b=dao.updateUser(user);
		if(b) {
			out.println("done");
			
			// getting the file path
			String path="E:/JAVA Exercise/Techno Geek/src/main/webapp/pic/"+user.getProfile();
			
			// getting the old file path
			String oldFilePath="E:/JAVA Exercise/Techno Geek/src/main/webapp/pic/"+oldFile;
			
			//deleting the old file using path
			if(!oldFile.equals("default.png")) {
			Helper.deleteFile(oldFilePath);
			}
			
			if(Helper.saveFile(p.getInputStream(), path)) {
				out.println("Profile Updated");
				Message msg=new Message("Profile Updated Successfully","success","alert-success");
				s.setAttribute("msg", msg);
			}
			else {
				Message msg=new Message("Something Went Wrong..try again","error","alert-danger");
				s.setAttribute("msg", msg);
			}
			
		}
		else {
			Message msg=new Message("Something Went Wrong..try again","error","alert-danger");
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}

}
