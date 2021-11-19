package sms;

public class otpcaller {
	
	
	public static void main(String[] args)
	{
		
		
		String number="9873560276";
		SendOTP send= new SendOTP();
		
		String a=send.call(number);
		System.out.println(a);
		
		
	}
	
	
	

}
