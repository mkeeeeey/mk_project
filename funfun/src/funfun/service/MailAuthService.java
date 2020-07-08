package funfun.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import funfun.repository.MailRepo;
import funfun.vo.MailAuth;

@Service
public class MailAuthService {
	
	@Autowired(required=false)
	private JavaMailSender sender;
	
	@Autowired(required=false)
	private MailRepo repo;
	
	
	public void sendMail(String mail) throws MessagingException {
		
		//랜덤 인증번호 생성
		int ranNumber=(int)(Math.random()*10000);
		// 1. 멀티미디어형 메일 데이터 전송
		MimeMessage msg = sender.createMimeMessage();
		// 2. 제목 설정
		msg.setSubject("FunFun 인증번호 발송");
		// 3. 수신자 설정.
		msg.setRecipient(RecipientType.TO, new InternetAddress(mail));
		// 4. 내용 설정.
		String mailMsg="인증번호는 "+ranNumber+"입니다.";
		msg.setText(mailMsg);
		// 5. 발송 처리..
		sender.send(msg);
		// 메일 전송은 서비스 단에서 처리하는 게 좋음..
		
		//전송된 메일에 포함된 인증번호 DB에 insert
		MailAuth mailAuth=new MailAuth();
		mailAuth.setEmail(mail);
		mailAuth.setAuthNumber(ranNumber);
		repo.insertAuthData(mailAuth);
	}
	
	public int getAuthData(String email) {
		return repo.getAuthData(email);
	}
	
	public void expireMailCode(int code) {
		repo.expireMailCode(code);
	}
}
