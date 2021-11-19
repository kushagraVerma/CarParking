package com.carpark.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.login.dao.UserDAO;
import com.carpark.model.User;

@WebServlet("/VerifyOTP")
public class VerifyOTP extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inotp = request.getParameter("inotp");
		HttpSession session = request.getSession();
		String otp = (String) session.getAttribute("OTP");
		User u = (User) session.getAttribute("new-user");
		if(otp.equals(inotp)) {
			UserDAO udao = new UserDAO();
			udao.addVerified(u);
			session.setAttribute("user", u);
			session.removeAttribute("new-user");
			response.sendRedirect("home.jsp");
			
		}else {
//			session.removeAttribute("OTP");
			session.setAttribute("wrong-otp",true);
//			response.sendRedirect("registerCred");
			response.sendRedirect("otp.jsp");
		}
	}

}
