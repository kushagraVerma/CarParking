package com.carpark.admview.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.dao.ParkDAO;
import com.carpark.model.Park;

/**
 * Servlet implementation class viewparkdetails
 */
@WebServlet("/viewparkdetails2")	
public class viewparkdetails2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String Loc = request.getParameter("Location");
    		String CiDT = request.getParameter("DateTimeIn");
    		String CoDT = CiDT;
    		HttpSession session = request.getSession();
    		ParkDAO pdao = new ParkDAO();
    		ArrayList<Park> p = pdao.fromBooking(Loc, CiDT, CoDT);
    		if(p!=null) {
    			session.setAttribute("Info", p);
    			session.setAttribute("Location", Loc);
    			session.setAttribute("Time", CiDT);
    			response.sendRedirect("addwrktable.jsp");
    		}else System.out.println("NULL!");
    	}
}
