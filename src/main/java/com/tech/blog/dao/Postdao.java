package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class Postdao {
	
	Connection con;
	
	
 public Postdao(Connection con) {
		super();
		this.con = con;
	}


public ArrayList<Category> getCategories(){
	 
	 ArrayList<Category> lst=new ArrayList<>();
	 
	 try {
		 String q="select * from categories";
		 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery(q);
		 while(rs.next()) {
			 int cid=rs.getInt("cid");
			 String name=rs.getString("name");
			 String description=rs.getString("description");
			 
			 Category c=new Category(cid, name, description);
			 lst.add(c);
			 
		 }
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	 return lst;
 }
public boolean savepost(Post p) {
	boolean f=false;
	
	try {
		String q="insert into posts(ptitle, pcontent,pcode,ppic,catid,userid) values(?, ?, ?, ?, ?, ?) ";
		PreparedStatement pt=con.prepareStatement(q);
		pt.setString(1, p.getPtitle());
		pt.setString(2, p.getPcontent());
		pt.setString(3, p.getPcode());
		pt.setString(4, p.getPpic());
		pt.setInt(5, p.getCatid());
		pt.setInt(6, p.getUserid());
		
		pt.executeUpdate();
		f=true;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}

public List<Post> getallpost(){
	List<Post>lst=new ArrayList<>();
	
	try {
		String q="select * from posts order by pid desc";
		PreparedStatement p=con.prepareStatement(q);
		ResultSet rs=p.executeQuery();
		
		while(rs.next()) {
			int pid=rs.getInt("pid");
			String ptitle=rs.getString("ptitle");
			String pcontemt=rs.getString("pcontent");
			String pcode=rs.getString("pcode");
			String ppic=rs.getString("ppic");
			Timestamp pdate=rs.getTimestamp("pdate");
			int catid=rs.getInt("catid");
			int userid=rs.getInt("userid");
			
			Post post=new Post(pid,ptitle, pcontemt, pcode, ppic, pdate, catid, userid);
			lst.add(post);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		
		// TODO: handle exception
	}
	
	
	return lst;
}

	public List<Post> getpostbycatid(int catid){
		List<Post>lst=new ArrayList<>();
		
		try {
			String q="select * from posts where catid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, catid);
			ResultSet rs=p.executeQuery();
			
			
			while(rs.next()) {
				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontemt=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				String ppic=rs.getString("ppic");
				int userid=rs.getInt("userid");
				Timestamp pdate=rs.getTimestamp("pdate");
				
				
				Post post=new Post(pid,ptitle, pcontemt, pcode, ppic, pdate, catid, userid);
				lst.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}
		
		
		return lst;
	}
	
	public List<Post> getpostbyuserid(int userid){
		List<Post>lst=new ArrayList<>();
		
		try {
			String q="select * from posts where userid=?";
			
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, userid);
			ResultSet rs=p.executeQuery();
			
			
			while(rs.next()) {
				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontemt=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				String ppic=rs.getString("ppic");
				Timestamp pdate=rs.getTimestamp("pdate");
				int catid=rs.getInt("catid");
				
				Post post=new Post(pid,ptitle, pcontemt, pcode, ppic, pdate, catid, userid);
				lst.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}
		
		
		return lst;
	}
	
	public Post getpostbyid(int id) {
		Post p=null;
			
		try {
			String q="select * from posts where pid=?";
			PreparedStatement pt=con.prepareStatement(q);
			pt.setInt(1, id);
			
			ResultSet rs=pt.executeQuery();
			
			if(rs.next()) {
			
			int pid=rs.getInt("pid");
			String ptitle=rs.getString("ptitle");
			String pcontemt=rs.getString("pcontent");
			String pcode=rs.getString("pcode");
			String ppic=rs.getString("ppic");
			Timestamp pdate=rs.getTimestamp("pdate");
			int catid=rs.getInt("catid");
			int userid=rs.getInt("userid");
			
			p=new Post(pid,ptitle, pcontemt, pcode, ppic, pdate,catid, userid);
			
			}
			
		} catch (Exception e) {
	e.printStackTrace();
		}
		
		return p;		
		
	}


}
