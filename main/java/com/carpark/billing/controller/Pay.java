package com.carpark.billing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.billing.dao.LinkDAO;
import com.carpark.dao.ParkDAO;
import com.carpark.helper.Mailer;
import com.carpark.helper.SMSer;
import com.carpark.model.Park;
import com.carpark.model.User;

/**
 * Servlet implementation class Pay
 */
@WebServlet("/Pay")
public class Pay extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		Park slot = (Park) session.getAttribute("Slot");
		if(u!=null && slot!=null) {
			ParkDAO pdao = new ParkDAO();
			int Wid = pdao.getWid(Integer.parseInt(slot.getPID()));
			double amt = slot.getCost();
			pdao.addBooking(slot);
			LinkDAO ldao = new LinkDAO();
			String link = ldao.genLink(Wid);
			if(link!=null) {
				String msg = "You have paid Rs. " + amt + ". Thank you for using our services!"
						+ "\nYou can rate your experience at the link below."
						+ "\n" + "http://localhost:8080/Car_Park/FeedBack?link="+link;
				String logw = u.getLogw();
				if(logw.equals("CP")) {
					SMSer smser = new SMSer(u.getPhno(),msg);
					smser.send();
				}else {
					Mailer mailer = new Mailer(u.getEmail(),"Payment Confirmation",msg);
					mailer.send();
				}
				response.sendRedirect("home.jsp");
			}
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
