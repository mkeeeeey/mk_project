package funfun.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import funfun.vo.AdminMember;

// funfun.util.ExcelViewer
// 1. AbstractExcelView를 상속 처리.
public class ExcelViewer extends AbstractExcelView {
	private CellStyle cs;
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String modelNm = "memlist";
		ArrayList<AdminMember> memlist = (ArrayList<AdminMember>)model.get(modelNm);
		response.setHeader("Content-Disposition",
				"attachment;filename=\""+modelNm+".xls\";");
		cs= setStyle(workbook);	// workbook이 엑셀에 대한 객체를 지칭.
		
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "회원 정보");
		
		sheet.setColumnWidth(3, 256*15);	
		sheet.setColumnWidth(4, 256*30);	
		sheet.setColumnWidth(5, 256*15);	
		sheet.setColumnWidth(6, 256*50);	
		sheet.setColumnWidth(7, 256*15);	
		sheet.setColumnWidth(8, 256*10);	
		sheet.setColumnWidth(10, 256*15);	
		sheet.setColumnWidth(11, 256*15);	
		setExcelTitle(sheet);
		setExcelList(sheet,memlist);
		
	}
	
	public void setExcelTitle(HSSFSheet sheet) {
		HSSFRow titleRow = sheet.createRow(0);
		//titleRow.setHeight((short) 400);
		
		String []titles= {"번호","회원번호","이름","메이커번호","이메일","전화번호","관심 카테고리","프로필 이미지","상태","계좌은행","계좌번호","보유 예치금"};
		for(int idx=0;idx<titles.length;idx++) {
			HSSFCell cel = titleRow.createCell(idx); 
			cel.setCellValue(titles[idx]);
			cel.setCellStyle(cs); // 정의된 style을 적용할 부분에 대하여 설정
		}
	}

	public void setExcelList(HSSFSheet sheet, List<AdminMember> memlist) {
		for(int idx=0; idx<memlist.size();idx++) {
			AdminMember m = memlist.get(idx);
			HSSFRow dataRow = sheet.createRow(idx+1);
			
			HSSFCell cel0 = dataRow.createCell(0);	cel0.setCellValue(m.getCnt());
			HSSFCell cel1 = dataRow.createCell(1);	cel1.setCellValue(m.getMem_code());
			HSSFCell cel2 = dataRow.createCell(2);	cel2.setCellValue(m.getMem_name());
			HSSFCell cel3 = dataRow.createCell(3);	cel3.setCellValue(m.getMaker_code());
			HSSFCell cel4 = dataRow.createCell(4);	cel4.setCellValue(m.getMem_email());
			HSSFCell cel5 = dataRow.createCell(5);	cel5.setCellValue(m.getMem_phoneno());
			HSSFCell cel6 = dataRow.createCell(6);	cel6.setCellValue(m.getMem_favor());
			HSSFCell cel7 = dataRow.createCell(7);	cel7.setCellValue(m.getMem_profile());
			HSSFCell cel8 = dataRow.createCell(8);	cel8.setCellValue(""+m.getMem_curr());
			HSSFCell cel9 = dataRow.createCell(9);	cel9.setCellValue(m.getMem_bank());
			HSSFCell cel10 = dataRow.createCell(10);cel10.setCellValue(m.getMem_account());
			HSSFCell cel11 = dataRow.createCell(11);cel11.setCellValue(m.getMem_balance());
		}
	}
	public CellStyle setStyle(HSSFWorkbook workbook) {
		//스타일 설정
		CellStyle styleOfColorTest = workbook.createCellStyle();
		 
		//정렬
		styleOfColorTest.setAlignment(CellStyle.ALIGN_CENTER);
		styleOfColorTest.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		//테두리 라인
		styleOfColorTest.setBorderRight(HSSFCellStyle.BORDER_THIN);
		styleOfColorTest.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		styleOfColorTest.setBorderTop(HSSFCellStyle.BORDER_THIN);
		styleOfColorTest.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		//폰트 설정
		HSSFFont fontOfGothic = workbook.createFont();
		fontOfGothic.setFontName("고딕");
		fontOfGothic.setFontHeight((short) 200);
		styleOfColorTest.setFont(fontOfGothic);
		//배경색
		styleOfColorTest.setFillForegroundColor(HSSFColor.AQUA.index);  
		styleOfColorTest.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		return styleOfColorTest;
	}
	
}





