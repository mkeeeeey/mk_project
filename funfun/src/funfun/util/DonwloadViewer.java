package funfun.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;


//Download할 수 있게끔 해주는 것
public class DonwloadViewer extends AbstractView{
	//현재 다운로드할 파일의 위치(공통설정파일에
	@Value("${upload}")
	private String upload;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		// 요청으로 온 file명은 model이름을 downloadviewer에게 호출한다.
		// 모델명은 downloadFile, 실제 파일명을 할당 처리..
		// model.addAttribute("downloadFile", 파일명);
		// 1. controller에서 전달되어온 파일명으로 파일 객체 할당
		String fname = (String)model.get("downloadFile");
		//		1) 파일을 객체로 생성 처리하여, 전달 준비.
		File file = new File(upload+fname);
		System.out.println("## viewer에 오신 것을 환영합니다 ##");
		System.out.println("전체파일명:"+file.getPath());
		System.out.println("파일명:"+file.getName());
		System.out.println("파일길이:"+(int)file.length());
		// 2. 다운로드 처리를 위한 response 객체 설정..
		//		1) 파일다운을 처리하기 위한 contentType 설정.
		response.setContentType("application/download; charset=UTF-8");
		//		2) 파일의 길이와 파일명 설정.
		response.setContentLength((int)file.length());
		//			- 한글파일명을 위한 encoding 처리..
		fname = URLEncoder.encode(fname, "utf-8").replaceAll("\\+", " ");
		// 3. Header 정보 설정..
		response.setHeader("Content-Disposition", "attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 4. 파일을 InputStream으로 전환하여 response의 OutStream에 탑재하여 처리
		FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		//		1) FileCopyUtils의 copy메서드를 통해서 전달.
		FileCopyUtils.copy(fis,  out);
		//		2) 전송완료 처리..
		out.flush();
//		springweb1.z02_util.DonwloadViewer
	}
}
