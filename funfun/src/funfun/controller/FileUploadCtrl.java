package funfun.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import funfun.service.FileUploadService;
import funfun.util.Uploader;


@Controller
public class FileUploadCtrl {
	
	Uploader uploader;
	@RequestMapping("/test1.do")
	public String test1() {
		
		System.out.println("파일업로드테스트시작");
			
		return "WEB-INF\\views\\main\\fileUploadTest.jsp";
	}
	
	@RequestMapping("/test2.do")
	public String test2() {
		System.out.println("웹소켓 테스트");
		
		return "WEB-INF\\views\\main\\notificationTest.jsp";
	}
	
	//파일업로드처리
	@RequestMapping("/fileUpload.do")
	public String fileUpload(@RequestParam("myfile") MultipartFile[] myfiles) {
		uploader=new Uploader();
		System.out.println("파일업로드처리");
		String result = uploader.upload(myfiles[0]);
		System.out.println(result);
		return "";
	}
	

}
