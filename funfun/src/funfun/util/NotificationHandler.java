package funfun.util;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller("notificationHandler")
public class NotificationHandler extends TextWebSocketHandler{
	// Map<String, WebSocketSession>
	// 	String : clinet의 식별 id
	//  WebSocketSession : 어떤 메시지를 전달받고, 전달하는지?
	private Map<String, WebSocketSession> users = new ConcurrentHashMap();
	
	// 1. 초기 clinet에서 접속 완료후, 처리할 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		
		log(session.getId()+"님 알림서버에 접속");
		users.put(session.getId(), session);
	}
	// 2. 메시지를 보낼 때 처리할 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		
		log(session.getId()+"가 답변사항을 변경하였습니다.");
		
		// 전달 되도록 조건문 설정.
		for(WebSocketSession ws : users.values()) {
			//모든 웹소켓 접속자에게 메세지 전달..
			ws.sendMessage(message);
			log(ws.getId()+"님에게 전달 메시지 : "+message.getPayload());
		}
	}
	
	// 3. 접속 종료시 처리할 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		log(session.getId()+" 알림서버 접속 종료 합니다.");
		users.remove(session.getId());
	}
	
	// 4. 예외가 발생시 처리할 메서드.
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		log(session.getId()+" 에러 발생 에러 내용 : "+exception.getMessage());
	}
	private void log(String logMsg) {
		System.out.println(new Date()+" : "+logMsg);
	}
}
