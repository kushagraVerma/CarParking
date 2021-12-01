package com.carpark.billing.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.carpark.billing.model.Link;

public class LinkDAO {
	final private static String url = "jdbc:mysql://localhost:3306/carpark";
	final private static String username = "root";
	final private static String password = "1234";
	public int getWid(String Link) {
		String sql = "select wid from links where link=?";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setString(1, Link);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return rs.getInt("wid");
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
		return -1;
	}
	public String genLink(int Wid) {
		String sql = "insert into links values(?,?)";
		Connection con = null;
		PreparedStatement st = null;
		String link = null;
		int valid = 0;
		while(valid!=-1) {
			link = Link.generate(6);
			valid = getWid(link);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setString(1, link);
			st.setInt(2, Wid);
			st.executeUpdate();
			return link;
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
	public void remove(String Link) {
		String sql = "delete from links where link=?";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setString(1, Link);
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
