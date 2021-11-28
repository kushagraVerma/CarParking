package com.carpark.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.carpark.model.Worker;

public class WorkerDAO {
	final private static String url = "jdbc:mysql://localhost:3306/carpark";
	final private static String username = "root";
	final private static String password = "1234";

	public Worker fromCreds(String uname, String pass) {
		String sql = "select * from Workers where uname=? and pass=?";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Worker w = new Worker(uname);
				w.setPass(pass);
				return w;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				st.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
