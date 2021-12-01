package com.carpark.model;

public class Worker {
	private String uname,pass;
	public Worker(String UN) {
		uname = UN;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
}
