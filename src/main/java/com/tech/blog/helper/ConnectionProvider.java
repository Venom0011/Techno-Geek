package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {

		try {

			if (con == null) {
				// Loading driver class
				Class.forName("com.mysql.jdbc.Driver");
				
				// Creating connection
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technogeek?useSSL=false", "root",
						"Abhishek@123");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}
