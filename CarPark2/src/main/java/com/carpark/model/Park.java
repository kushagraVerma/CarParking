package com.carpark.model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Park {
	private String PID, Loc, DTin, DTout;
	private double Cost;
	private int Emt, WaitingTime;
	public double getCost() {
		return Cost;
	}
	public void setCost(double cost) {
		Cost = cost;
	}
	public String getPID() {
		return PID;
	}
	public void setPID(String pID) {
		PID = pID;
	}
	public int getEmt() {
		return Emt;
	}
	public void setEmt(int emt) {
		Emt = emt;
	}
	public Park(String Location, String DateTimeIn, String DateTimeOut) {
		Location = Loc; DateTimeIn = DTin; DateTimeOut = DTout;
	}
	public String getLoc() {
		return Loc;
	}
	public void setLoc(String Loc) {
		this.Loc = Loc;
	}
	public String getDTin() {
		return DTin;
	}
	public void setDTin(String DTin) {
		this.DTin = DTin;
	}
	public String getDTout() {
		return DTout;
	}
	public void setDTout(String DTout) {
		this.DTout = DTout;
	}
	public void setDetails(String pID, String Loc, String DTin, String DTout) {
		if(pID!=null || pID!="")		setPID(pID);
		if(Loc!=null || Loc!="")		setLoc(Loc);
		if(DTin!=null || DTin!="")		setDTin(DTin);
		if(DTout!=null || DTout!="")	setDTout(DTout);
	}
	@Override
	public String toString() {
		return "Park [PID =" + PID + ", Location =" + Loc + ", Check-In Date and Time =" + DTin + ","
				+ " Check-Out Date and Time =" + DTout + ", Cost =" + Cost
				+ ", Waiting Time =" + WaitingTime + "]";
	}
	public static double getBill(String CiDT, String CoDT) {
		Pattern p = Pattern.compile("(\\d+)-(\\d+)-(\\d+)[\\sT](\\d+):(\\d+)");
		Matcher m1 = p.matcher(CiDT);
		Matcher m2 = p.matcher(CoDT);
		m1.find();
		m2.find();
		int cidt = Integer.parseInt(m2.group(4)) * 60 + Integer.parseInt(m2.group(5));
		int codt = Integer.parseInt(m1.group(4)) * 60 + Integer.parseInt(m1.group(5));
		double hours = codt - cidt;
		System.out.println(Math.ceil(hours/60));
		return Math.ceil(hours/60) * 25;
	}
	public int getWaitingTime(String CiDT) {
		Pattern p = Pattern.compile("(\\d+)-(\\d+)-(\\d+)[\\sT](\\d+):(\\d+)");
		Matcher m1 = p.matcher(CiDT);
		m1.find();
		Matcher m2 = p.matcher(DTout);
		m2.find();
		WaitingTime = 0;
		if(Integer.parseInt(m1.group(3)) == Integer.parseInt(m2.group(3))) {
				int codt = Integer.parseInt(m2.group(4)) * 60 + Integer.parseInt(m2.group(5));
				int cidt = Integer.parseInt(m1.group(4)) * 60 + Integer.parseInt(m1.group(5));
				WaitingTime = codt - cidt;
		}
		if(WaitingTime < 0)
			WaitingTime = 0;
		System.out.println(WaitingTime);
		return WaitingTime;
	}
	public int getWaitingTime() {
		return WaitingTime;
	}
}