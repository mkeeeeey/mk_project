package funfun.service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import funfun.repository.sh_secessionReposi;
import funfun.vo.sesessionMail;
@Service
public class sh_secessionService {
	@Autowired(required=false)
	private sh_secessionReposi dao;
	
	@Autowired(required=false)
	private JavaMailSender sender;
	
	
	public int finalPrc(String memEmail){
		return dao.finalPrc(memEmail);
	
	}
	public void sendMail(sesessionMail email) throws MessagingException {	
		MimeMessage msg = sender.createMimeMessage();
		msg.setSubject(email.getSubject());
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
		msg.setText(email.getContent());
		sender.send(msg);		
	}
}
