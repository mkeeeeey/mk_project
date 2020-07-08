package funfun.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.repository.HT_ProjectRegReposi;
import funfun.vo.MakerStudio;
import funfun.vo.ProOption;
import funfun.vo.ProRisk;
import funfun.vo.Project;

@Service
public class HT_ProjectRegService {

	@Autowired(required=false)
	private HT_ProjectRegReposi dao;
	
	public MakerStudio makerInfo(int mem_code) {
		MakerStudio d= dao.makerInfo(mem_code);
		return d;
	}
	
	public void proCreate(Project cre) {
		System.out.println("프로젝트 등록 찍혔음???");
		dao.proCreate(cre); 

	}

	public int getProjectCode() {
		return dao.getProjectCode();
	}
	
	public void proBasicInfo(Project cre) {
		System.out.println("기본 정보 업뎃 찍힘???");
		dao.proBasicInfo(cre);
	}
	
	public void proStory(Project cre) {
		System.out.println("프로젝트 스토리 업뎃");
		dao.proStory(cre);
	}
	
	public ArrayList<ProOption> getProOptionList(int pro_code){
		return dao.getProOptionList(pro_code);
	}
	
	public int getProOptionListCount(int pro_code) {
		return dao.getProOptionListCount(pro_code);
	}
	
	public void regProOption(ProOption cre) {
		dao.regProOption(cre);
	}
	
	public void uptProOption(ProOption cre) {
		dao.uptProOption(cre);
	}
	
	public void deleteProOption(int opt_code) {
		dao.deleteProOption(opt_code);
	}
	
	public ArrayList<ProRisk> getProRiskList(int pro_code){
		return dao.getProRiskList(pro_code);
	}
	
	public int getProRiskListCount(int pro_code) {
		return dao.getProRiskListCount(pro_code);
	}
	
	public void regProRisk(ProRisk cre) {
		dao.regProRisk(cre);
	}
	
	public void updateProRisk(ProRisk cre) {
		dao.updateProRisk(cre);
	}
	
	public void deleteProRisk(int risk_code) {
		dao.deleteProRisk(risk_code);
	}
	
	public Project projectInfo(int pro_code) {
		return dao.projectInfo(pro_code);
	}
	
	public void projectRegister(int pro_code) {
		dao.projectRegister(pro_code);
	}
}
