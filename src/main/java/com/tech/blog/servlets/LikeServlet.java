package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.Likedao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation=request.getParameter("operation");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		
		PrintWriter out=response.getWriter();
		
		Likedao ldao=new Likedao(ConnectionProvider.getConnection());
		if(operation.equals("like")) {
			if(!ldao.isLikeByUser(pid, uid)) {
				boolean f=ldao.insertLike(pid, uid);
				out.println(f);
			}
			else {
				out.print("error");
			}
		}

	}


}
