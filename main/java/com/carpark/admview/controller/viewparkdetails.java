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
@WebServlet("/viewparkdetails")	
public class viewparkdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		HttpSession session = request.getSession();
			String Loc = null;
			if(request.getParameter("Location")!=null) {
	    		Loc = request.getParameter("Location");
	    		session.setAttribute("Location",Loc);
			}else {
				Loc = (String) session.getAttribute("Location");
			}
    		String CiDT = null;
			if(request.getParameter("DateTimeIn")!=null) {
				CiDT = request.getParameter("DateTimeIn");
				session.setAttribute("Time", CiDT); 
			}else {
				CiDT = (String) session.getAttribute("Time");
			}
    		String CoDT = CiDT;
    		ParkDAO pdao = new ParkDAO();
    		ArrayList<Park> p = pdao.fromBooking2(Loc, CiDT, CoDT);
    		if(p!=null) {
    			session.setAttribute("Info", p);
    			if(session.getAttribute("Location")==null) {
    				session.setAttribute("Location", Loc);
    			}
    			if(session.getAttribute("Time")==null) {
        			session.setAttribute("Time", CiDT);    				
    			}
    			response.sendRedirect("finalparkview.jsp");
    		}else System.out.println("NULL!");
    	}
}
