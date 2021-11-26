package com.carpark.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.dao.UserDAO;
import com.carpark.model.User;

@WebServlet("/LoginFB")
public class LoginFB extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String fname = (String) request.getParameter("fname");
		String lname = (String) request.getParameter("lname");
		String email = (String) request.getParameter("email");
		UserDAO udao = new UserDAO();
		User u = udao.fromNonCred(email);
		if(u!=null) {
			session.setAttribute("user", u);
			response.sendRedirect("home.jsp");
		}else {
			u = new User("email",email);
			u.setDetails(fname,lname,email,"","","","","","FB");
			session.setAttribute("new-user-re",u);
			response.sendRedirect("fill.jsp");
		}
	}

}
