package com.carpark.login.helper;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailOTP  {
	//https://www.tutorialspoint.com/javamail_api/javamail_api_sending_simple_email.htm
	
	private String genOTP() {
		String otp = "";
		Random rand = new Random();
		for(int i = 0; i < 6; i++) {
			int digit = rand.nextInt(10);
			otp = otp + digit;
		}
		return otp;
	}
	
	public String send(String to) {
	      final String Otp = genOTP();
	      final String msg = "Your OTP is " + Otp;
	      final String from = "carparkingsols@gmail.com";//change accordingly
	      final String username = "carparkingsols";//change accordingly
	      final String password = "1234Car1234";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");
	      props.put("mail.smtp.ssl.protocols", "TLSv1.2");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	         InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject("Verify Your Account");

	         // Now set the actual message
	         message.setText(msg);

	         // Send message
	         Transport.send(message);

	         System.out.println("Sent message successfully....");

	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }
	      return Otp;		
	}
}
