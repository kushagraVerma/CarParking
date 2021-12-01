package com.carpark.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.carpark.model.Park;

public class ParkDAO {
	//java.util.Date dt = new java.util.Date();
	String url = "jdbc:mysql://localhost:3306/carpark";
	String username = "root";
	String password = "1234";
	public ArrayList<Park> fromBooking(String Loc, String CiDT, String CoDT) {
		String sql = "select parkspace.pid as parkid,cin,max(cout) as cout,avg(cin>? or cout<?)=1 as available,uid "
				+ "from parkspace,booking "
				+ "where parkspace.pid=booking.pid and loc=? "
				+ "group by parkid";
		//String sql = "select booking.pid,cin,cout,(cin>? or cout<?) as Available from booking where pid in (select pid from parkspace where loc=?);";
		Connection con = null;
		PreparedStatement st = null;
		try {
			ArrayList<Park> p = new ArrayList<Park>();
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setString(1, CoDT);
			st.setString(2, CiDT);
			st.setString(3, Loc);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Park Slot = new Park(Loc, CiDT, CoDT);
				if(rs.getString("parkid")!=null) {
					Slot.setPID(rs.getString("parkid"));
				}
				Slot.setLoc(Loc);
				if(rs.getString("cin")!=null) {
					Slot.setDTin(rs.getString("cin"));
				}
				if(rs.getString("cout")!=null) {
					Slot.setDTout(rs.getString("cout"));
				}
				Slot.getWaitingTime(CiDT);
				Slot.setUid(rs.getInt("uid"));
				Slot.setEmt(rs.getInt("available"));
				Slot.setCost(Park.getBill(CiDT, CoDT));
				p.add(Slot);
			}
			return p;
		}
		catch(Exception e) {
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
	public ArrayList<String> getLocs() {
		String sql = "select distinct(loc) as location from parkspace;";
		Connection con = null;
		PreparedStatement st = null;
		try {
			ArrayList<String> locs = new ArrayList<String>();
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				locs.add(rs.getString("location"));
			}
			return locs;
		}
		catch(Exception e) {
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
	public int getWid(int Pid) {
		String sql = "select wid from parkspace where pid=?";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setInt(1, Pid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
//				System.out.println(rs.getInt("wid") + " " + Pid);
				return rs.getInt("wid");
			}
		}
		catch(Exception e) {
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
	public void addBooking(Park slot) {
		String sql = "insert into booking values(?,?,?,?)";
		Connection con = null;
		PreparedStatement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			st = con.prepareStatement(sql);
			st.setInt(1, Integer.parseInt(slot.getPID()));
			st.setString(2, slot.getDTin());
			st.setString(3, slot.getDTout());
			st.setInt(4, slot.getUid());
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

