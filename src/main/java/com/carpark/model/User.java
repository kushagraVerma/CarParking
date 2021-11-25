package com.carpark.model;

public class User {
	private String fn,ln,un,pw,addr,email,phno,carno,logw;
	public User(String UN) {
		un = UN;
	}
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	public String getLn() {
		return ln;
	}
	public void setLn(String ln) {
		this.ln = ln;
	}
	public String getUn() {
		return un;
	}
	public void setUn(String un) {
		this.un = un;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getCarno() {
		return carno;
	}
	public void setCarno(String carno) {
		this.carno = carno;
	}
	public String getLogw() {
		return logw;
	}
	public void setLogw(String logw) {
		this.logw = logw;
	}
	public void setDetails(String Fn, String Ln, String Pw, String Ad, String Em, String Ph, String Cr, String Lw) {
		if(Fn!=null || Fn!="") setFn(Fn);
		if(Ln!=null || Ln!="") setLn(Ln);
		if(Pw!=null || Pw!="") setPw(Pw);
		if(Ad!=null || Ad!="") setAddr(Ad);
		if(Em!=null || Em!="") setEmail(Em);
		if(Ph!=null || Ph!="") setPhno(Ph);
		if(Cr!=null || Cr!="") setCarno(Cr);
		if(Lw!=null || Lw!="") setLogw(Lw);
	}
	@Override
	public String toString() {
		return "User [fn=" + fn + ", ln=" + ln + ", un=" + un + ", pw=" + pw + ", addr=" + addr + ", email=" + email
				+ ", phno=" + phno + ", carno=" + carno + ", logw=" + logw + "]";
	}
}
