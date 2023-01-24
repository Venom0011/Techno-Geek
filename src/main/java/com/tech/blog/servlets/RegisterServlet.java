package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
		String check=request.getParameter("check");
		if(check==null) {
			out.println("Please agree terms and condition");
		}
		else {
			String name=request.getParameter("uname");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
			User user=new User(name, email, password, gender, about);
			
			Userdao dao=new Userdao(ConnectionProvider.getConnection());
			
			if(dao.saveuser(user)) {
				out.println("done");
			}
			else {
				out.println("error");
			}
		}
	}

}
