package com.carpark.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.carpark.model.User;

public class UserDAO {
	String url = "jdbc:mysql://localhost:3306/carpark";
	String username = "root";
	String password = "1234";
	public User fromCred(String uname, String pass) {
		String sql = "select * from UserReg where uname=? and pass=?";
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
				User u = new User(uname,pass);
				u.setDetails(
						rs.getString("fname"),
						rs.getString("lname"),
						rs.getString("address"),
						rs.getString("email"),
						rs.getString("phno"),
						rs.getString("carno")
					);
				return u;
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
	public void addVerified(User u) {
		String sql = "insert into UserReg "
				+ "(uname,pass,fname,lname,address,email,phno,carno) "
				+ "values(?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setString(1, u.getUn()!=null? u.getUn(): "NULL");
			st.setString(2, u.getPw()!=null ? u.getPw() : "NULL");
			st.setString(3, u.getFn()!=null? u.getFn() : "NULL");
			st.setString(4, u.getLn()!=null? u.getLn() : "NULL");
			st.setString(5, u.getAddr()!=null? u.getAddr() : "NULL");
			st.setString(6, u.getEmail()!=null? u.getEmail() : "NULL");
			st.setString(7, u.getPhno()!=null? u.getPhno() : "NULL");
			st.setString(8, u.getCarno()!=null? u.getCarno() : "NULL");
			st.executeUpdate();
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
	}
}
