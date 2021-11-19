package sms;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;


public class SendOTP {
	
	public static void Sendotp(String message , String number , String apiKey)
	{
		try
		{
		String sendId="TXTIND";
//		String language="english";
		String route="v3";
		
		message=URLEncoder.encode(message,"UTF-8");    //Important Step
		
//		String myUrl="'https://www.fast2sms.com/dev/bulkV2?authorization="+apiKey+"&message=This is test message&language=english&route=q&numbers="+number"
		String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&route="+route+"&numbers="+number;

		URL url=new URL(myUrl);
//		System.out.println(url);
		
		HttpsURLConnection con= (HttpsURLConnection)url.openConnection();
		
		con.setRequestMethod("GET");
		
		con.setRequestProperty("User-Agent","Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache"); 
		
		int responseCode= con.getResponseCode();
		
		StringBuffer response=new StringBuffer();
		
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		while(true)
		{
			String line=br.readLine();
			
			if(line==null)
			{
				break;
			}
			
			response.append(line);
		}
		
//		System.out.println(response);
		
		}
		catch(Exception e)
		{
			System.out.println("hello" + e);
		}
		
	}
	
    public static String call(String num) 
	{
//		   System.out.println("Program Started....");
		   
		   OTP otp=new OTP();
		   String otpmessage= otp.generateOTP(5);
//		   System.out.println( "Generate OTP : "+otpmessage);
		   
		   String apiKey="5VR7LjcNM0arY2dxfZGQO3JKDnhi9u4vEsp6FmAPlUT1zIC8wWZk1aMhc0YlBJyVSXIbQjgsPR85eO7U";
//		   String number="9958870177";
		   String number=num;
//		  System.out.println("Hello"); 
		   Sendotp("This message is sent by car parking solutions. Your OTP is :"+otpmessage,number,apiKey);
		   return otpmessage;
	}

}
