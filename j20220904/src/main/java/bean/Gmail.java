package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	private static Gmail instance;
	
	private Gmail() {}
	
	public static Gmail getInstance() {
		if(instance == null) {
			instance = new Gmail();
		}
		return instance;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("rmaksgnacu@gmail.com", "ffljgzfbzocabjmt");
	}
}