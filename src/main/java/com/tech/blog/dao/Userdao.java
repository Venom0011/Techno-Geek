package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.*;


import com.tech.blog.entities.User;

public class Userdao {

		private Connection con;

		public Userdao(Connection con) {
			super();
			this.con = con;
		}
		
		public boolean saveuser(User u) {
			boolean f=false;
			try {
				String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
				PreparedStatement p=this.con.prepareStatement(query);
				p.setString(1, u.getName());
				p.setString(2, u.getEmail());
				p.setString(3, u.getPassword());
				p.setString(4, u.getGender());
				p.setString(5, u.getAbout());
				
				p.executeUpdate();
				System.out.println("done");
				f=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return f;
		}
		
		public User getUserbyEmailPassword(String email,String password) {
			User user=null;
			try {
				String query="select * from user where email=? and password=?";
				PreparedStatement p=con.prepareStatement(query);
				p.setString(1, email);
				p.setString(2, password);
				
				ResultSet rs=p.executeQuery();
				if(rs.next()) {
					user=new User();
					// fetching data from database
					String name=rs.getString("name");
					
					//setting data to user object
					user.setName(name);
					
					//Writing directly
					
					user.setId(rs.getInt("id"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setGender(rs.getString("gender"));
					user.setAbout(rs.getString("about"));
					user.setDateTime(rs.getTimestamp("rdate"));
					user.setProfile(rs.getString("profile"));
					
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return user;
		}
		
		public  boolean updateUser(User user) {
			
			boolean b=false;
			try {
				String query="update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=? ";
				PreparedStatement p=con.prepareStatement(query);
				p.setString(1, user.getName());
				p.setString(2, user.getEmail());
				p.setString(3, user.getPassword());
				p.setString(4, user.getGender());
				p.setString(5, user.getAbout());
				p.setString(6, user.getProfile());
				p.setInt(7, user.getId());
				
				p.executeUpdate();
				b=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return b;
		}
		
		public User getuserbyid(int id) {
			User user=null;
			
			try {
				String q="select * from user where id=?";
				PreparedStatement p=con.prepareStatement(q);
				p.setInt(1, id);
				ResultSet rs=p.executeQuery();
				if(rs.next()) {
					user=new User();
					// fetching data from database
					String name=rs.getString("name");
					
					//setting data to user object
					user.setName(name);
					
					//Writing directly
					
					user.setId(rs.getInt("id"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setGender(rs.getString("gender"));
					user.setAbout(rs.getString("about"));
					user.setDateTime(rs.getTimestamp("rdate"));
					user.setProfile(rs.getString("profile"));
					
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return user;
		}
}
