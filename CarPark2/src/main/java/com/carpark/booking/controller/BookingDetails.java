package com.carpark.booking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.booking.dao.ParkDAO;
import com.carpark.model.Park;

/**
 * Servlet implementation class BookingDetails
 */
@WebServlet("/BookingDetails")
public class BookingDetails extends HttpServlet {
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String Loc = request.getParameter("Location");
    		String CiDT = request.getParameter("DateTimeIn");
    		String CoDT = request.getParameter("DateTimeOut");
    		HttpSession session = request.getSession();
    		ParkDAO udao = new ParkDAO();
    		ArrayList<Park> u = udao.fromBooking(Loc, CiDT, CoDT);
			session.setAttribute("ParkingList", u);
    		if(u!=null) {
    			session.setAttribute("Location", Loc);
    			session.setAttribute("DateTimeIn", CiDT);
    			session.setAttribute("DateTimeOut", CoDT);
    			response.sendRedirect("Choosing.jsp");
    		}
    	}
}
