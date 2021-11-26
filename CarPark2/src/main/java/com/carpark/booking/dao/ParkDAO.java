package com.carpark.booking.dao;

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
		String sql = "select booking.pid,cin,cout,(cin>? or cout<?) as Available from booking where pid in (select pid from parkspace where loc=?);;";
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
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Park Slot = new Park(Loc, CiDT, CoDT);
				if(rs.getString("booking.pid")!=null) {
					Slot.setPID(rs.getString("booking.pid"));
				}
				if(rs.getString("Location")!=null) {
					Slot.setLoc(rs.getString("Location"));
				}
				if(rs.getString("DateTimeIn")!=null) {
					Slot.setDTin(rs.getString("DateIn"));
				}
				if(rs.getString("DateTimeOut")!=null) {
					Slot.setDTout(rs.getString("DateOut"));
				}
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
}

