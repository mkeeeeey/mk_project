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


//Download�� �� �ְԲ� ���ִ� ��
public class DonwloadViewer extends AbstractView{
	//���� �ٿ�ε��� ������ ��ġ(���뼳�����Ͽ�
	@Value("${upload}")
	private String upload;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		// ��û���� �� file���� model�̸��� downloadviewer���� ȣ���Ѵ�.
		// �𵨸��� downloadFile, ���� ���ϸ��� �Ҵ� ó��..
		// model.addAttribute("downloadFile", ���ϸ�);
		// 1. controller���� ���޵Ǿ�� ���ϸ����� ���� ��ü �Ҵ�
		String fname = (String)model.get("downloadFile");
		//		1) ������ ��ü�� ���� ó���Ͽ�, ���� �غ�.
		File file = new File(upload+fname);
		System.out.println("## viewer�� ���� ���� ȯ���մϴ� ##");
		System.out.println("��ü���ϸ�:"+file.getPath());
		System.out.println("���ϸ�:"+file.getName());
		System.out.println("���ϱ���:"+(int)file.length());
		// 2. �ٿ�ε� ó���� ���� response ��ü ����..
		//		1) ���ϴٿ��� ó���ϱ� ���� contentType ����.
		response.setContentType("application/download; charset=UTF-8");
		//		2) ������ ���̿� ���ϸ� ����.
		response.setContentLength((int)file.length());
		//			- �ѱ����ϸ��� ���� encoding ó��..
		fname = URLEncoder.encode(fname, "utf-8").replaceAll("\\+", " ");
		// 3. Header ���� ����..
		response.setHeader("Content-Disposition", "attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 4. ������ InputStream���� ��ȯ�Ͽ� response�� OutStream�� ž���Ͽ� ó��
		FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		//		1) FileCopyUtils�� copy�޼��带 ���ؼ� ����.
		FileCopyUtils.copy(fis,  out);
		//		2) ���ۿϷ� ó��..
		out.flush();
//		springweb1.z02_util.DonwloadViewer
	}
}
