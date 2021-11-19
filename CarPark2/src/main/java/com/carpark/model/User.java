package com.carpark.model;

public class User {
	private String fn,ln,un,pw,addr,email,phno,carno;
	public User(String UN, String PW) {
		un = UN; pw = PW;
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
	public void setDetails(String fn, String ln, String addr, String email, String phno, String carno) {
		if(fn!="" && fn!=null) {
			setFn(fn);
		}
		if(ln!="" && ln!=null) {
			setLn(ln);
		}
		if(addr!="" && addr!=null) {
			setAddr(addr);
		}
		if(email!="" && email!=null) {
			setEmail(email);
		}
		if(phno!="" && phno!=null) {
			setPhno(phno);
		}
		if(carno!="" && carno!=null) {
			setCarno(carno);
		}
	}
}
