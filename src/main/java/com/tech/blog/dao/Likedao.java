package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Likedao {
	
	Connection con;

	public Likedao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean insertLike(int pid,int uid) {
		boolean f=false;
		
		try {
			String q="insert into likes(pid,uid) values(?,?)";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public int counLikeonPost(int pid) {
		int count=0;
		
		try {
			String q="select count(*) from likes where pid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
		// or   count=rs.getInt("count(*)");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	// function to check if the user has already liked the post 
	public boolean isLikeByUser (int pid,int uid) {
		boolean f=false;
		
		try {
			String q="select * from likes where pid=? and uid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean dislikePost(int pid,int uid) {
		boolean f=false;
		
		try {
			String q="delete from likes where pid=? and uid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
