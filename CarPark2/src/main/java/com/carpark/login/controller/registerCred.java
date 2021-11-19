package com.carpark.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.login.helper.*;
import com.carpark.model.User;


@WebServlet("/CredentialRegister")
public class registerCred extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Resend OTP option???
//		User u = (User) session.getAttribute("new-user");
//		if(u==null) {
//			
//		}else {
//			
//		}
		
		boolean go = true;
		HttpSession session = request.getSession();
		String fn = request.getParameter("fname");
		String ln = request.getParameter("lname");
		String un = request.getParameter("uname");
		String p = request.getParameter("pass");
		String pC = request.getParameter("passCon");
		String ad = request.getParameter("address");
		String em = request.getParameter("email");
		String ph = request.getParameter("phno");
		String cr = request.getParameter("carno");
		User u = new User(un, p);
		u.setDetails(fn,ln,ad,em,ph,cr);
		session.setAttribute("new-user", u);
		
		if(!p.equals(pC)) {
			session.setAttribute("pw-mismatch",true);
			go = false;
		}
		if(ph.length()!=10) {
			session.setAttribute("wrong-ph",true);
			go = false;
		}
		if(go){
			String Otp = "";
			if(request.getParameter("emlOTP") != null) {
				MailOTP mailer = new MailOTP();
				Otp = mailer.send(u.getEmail());
//				String Otp = "123456";	
			}else if(request.getParameter("emlOTP") != null) {
				SMSOTP smser = new SMSOTP();
				Otp = smser.send(u.getPhno());
//				String Otp = "123456";	
			}
			session.setAttribute("OTP", Otp);
			response.sendRedirect("otp.jsp");				
		}else {
			response.sendRedirect("register.jsp");
		}
	}

}
