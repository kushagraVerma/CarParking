package com.carpark.slots.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.dao.ParkDAO;
import com.carpark.dao.WorkerDAO;
import com.carpark.model.Park;

@WebServlet("/Timeview")
public class Timeview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		ParkDAO pdao = new ParkDAO();
		WorkerDAO wdao = new WorkerDAO();
		
		String pid = request.getParameter("pid");
		String date = request.getParameter("date");
		ArrayList<Park> p= pdao.bookingFromPid((String)(pid),(String)date);
		
		session.setAttribute("Slots",p);
		session.setAttribute("date", date);
		session.setAttribute("pid", pid);
		
		
		
		response.sendRedirect("ParkSlotInfo.jsp");
	}

}