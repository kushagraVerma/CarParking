package com.carpark.model;

public class Park {
	private String Loc, DTin, DTout, Emt;
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
	public void setDetails(String Loc, String DTin, String DTout) {
		if(Loc!=null || Loc!="")		setLoc(Loc);
		if(DTin!=null || DTin!="")		setDTin(DTin);
		if(DTout!=null || DTout!="")	setDTout(DTout);
		if(Emt!=null || Emt!="")		setEmt(Emt);
	}
	@Override
	public String toString() {
		return "Park [Location=" + Loc + ", Check-in DateTime=" + DTin + ", Check-out DateTime=" + DTout + ", Available=" + Emt + "]";
	}
	
}
