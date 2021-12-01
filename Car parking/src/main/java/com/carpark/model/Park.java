package com.carpark.model;

public class Park {
	private String PID, Loc, DTin, DTout, Emt;
	public String getPID() {
		return PID;
	}
	public void setPID(String pID) {
		PID = pID;
	}
	public String getEmt() {
		return Emt;
	}
	public void setEmt(String emt) {
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
		if(Emt!=null || Emt!="")		setEmt(Emt);
	}
	@Override
	public String toString() {
		return "Park [PID=" + PID + ", Location=" + Loc + ", Check-In Date and Time=" + DTin + ", Check-Out Date and Time=" + DTout+" ]";
	}
	
}
